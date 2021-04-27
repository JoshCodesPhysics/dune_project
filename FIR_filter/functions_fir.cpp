#include <iostream>
#include "functions_fir.h"
// To import functions dealing with the same tready system
#include <fstream>
#include <string>
#include <sstream>
#include <stdio.h>
#include "ap_axi_sdata.h"

// Tap coefficients
short fir_coeffs[32] = {0,0,0,0,0,0,0,0,2,4,6,7,9,11,12,13,13,12,11,9,7,6,4,2
        				,0,0,0,0,0,0,0,0};

short fir_coeffs_SSR_axis[32] = {0,0,0,0,0,0,0,0,2,4,6,7,9,11,12,13,13,12,11,9,7,6,4,2
						         ,0,0,0,0,0,0,0,0};

short fir_coeffs_SSR_axis1[32] = {0,0,0,0,0,0,0,0,2,4,6,7,9,11,12,13,13,12,11,9,7,6,4,2
							      ,0,0,0,0,0,0,0,0};


// Prospective SSR array
short master_SSR[2*N_TAP][N_TAP];
short SSR_main[2*N_TAP][N_TAP] = {0};

// Tap array
short tap_array[N_TAP] = {0};
short tap_array1[N_TAP] = {0};
short SSR_temp[N_TAP] = {0};

// Channel counter for SSR top function
char channel_count = 0;
char restore_count = 0;
char sample_count0 = 0;
char sample_count1 = 0;
bool array_bool = true;

bool tlast_rec[CLK_REC] = {false};


void output_assign(short tdata_assign, short* tdata_o, bool tvalid_assign,
             	       bool* tvalid_o, bool tuser_assign, bool* tuser_o,
		       bool tkeep0_assign, bool* tkeep0_o, bool tkeep1_assign,
      		       bool* tkeep1_o, bool treset_assign, bool* treset_o,
		       bool tlast_assign, bool* tlast_o) {

	// Output assignment function to prevent repeated code
	// previous_assign is imported from functions_pedsub.cpp
	*tdata_o = tdata_assign;
	*tvalid_o = tvalid_assign;
	*tuser_o = tuser_assign;
	*tkeep0_o = tkeep0_assign;
	*tkeep1_o = tkeep1_assign;
	*treset_o = treset_assign;
	*tlast_o = tlast_assign;
}

void reg_shift_sum(bool* array_bool, short tap1[N_TAP], short tap2[N_TAP],
				   short tdata_in, short* sum) {
	// Function that shifts registers and sums the new taps, without causing
	// dependency issues

	short fir_coeffs2[32] = {0,0,0,0,0,0,0,0,2,4,6,7,9,11,12,13,13,12,11,9,7,6,4,2
								      ,0,0,0,0,0,0,0,0};

	*sum = 0;

	if (*array_bool) {
		register_loop: for (short i = N_TAP - 1; i >= 0; i--) {
							// Introduce new input to first register
							if (i==0) {
								tap2[i] = tdata_in;
							}
							// Move all other values up one register
							else {
								tap2[i] = tap1[i-1];
							}
						*sum = *sum + tap2[i]*fir_coeffs2[i];
			}
	}

	else {
		register_loop2: for (short i = N_TAP - 1; i >= 0; i--) {
							// Introduce new input to first register
							if (i==0) {
								tap1[i] = tdata_in;
							}
							// Move all other values up one register
							else {
								tap1[i] = tap2[i-1];
							}
						*sum = *sum + tap1[i]*fir_coeffs[i];
			}
	}

	*array_bool = !(*array_bool);
}

// Unused functions zone ////////////////////////////////////////////////

void fir_HLS_proto(short tdata_i, short* tdata_o,
	     bool tvalid_i, bool* tvalid_o, bool tuser_i, bool* tuser_o,
	     bool tkeep0_i, bool* tkeep0_o, bool tkeep1_i,
             bool* tkeep1_o, bool tready_i, bool treset_i,
             bool* treset_o, bool tlast_i, bool* tlast_o) {
	// Prototype FIR HLS top function for review. Takes input tdata_i
	// from pedestal subtraction block and multiplies it by the c0 coefficient,
	// before running it through the addition tree, and the original input is
	// moved forward one delay register by the SSR mechanism (moved
	// from array position x(n) to x(n-1)). On the next clock cycle a new
	// input comes in and the same thing happens to it. The initial first
	// input is multiplied by coefficient c1 and added to the next input
	// multiplied by c0. Once the 32 taps of the x array are filled, an
	// addition tree is formed of c0*x(n)+ c1*x(n-1)+ c2*x(n-2)...
	// to obtain the final summation and output of the filter. When tlast
	// goes high, the x32 to x64 inputs are saved, and the taps are restored
	// by the values saved for the next channel.

	// tready restore and addition tree variable
	static short tdata_previous;
	// boolean tready restores
	static bool tlast_reset, tvalid_previous, tuser_previous,
		    tkeep_previous, tlast_previous;
	// Delays restore for WIPE_DELAY clk's
	static char restore_count;

	// Reset static variables and arrays if treset goes high
	// Output the inputs with no processing.
	if (treset_i) {
		tlast_reset = false;
		restore_count = 0;
		channel_count = 0;
		reset_loop1: for (short i = 0; i < N_TAP; i++) {
			tap_array[i] = 0;
			reset_loop2: for (short j = 0; j < N_TAP*2; j++) {
				master_SSR[j][i] = 0;
			}
		}
		// Driving outputs regardless
		output_assign(0, &(*tdata_o),
                              tvalid_i, &(*tvalid_o), tuser_i,
                              &(*tuser_o), tkeep0_i, &(*tkeep0_o),
                              tkeep1_i, &(*tkeep1_o), treset_i,
                              &(*treset_o), tlast_i, &(*tlast_o));

                previous_assign(&tdata_previous,
                                &tvalid_previous,
                                &tuser_previous,
                                &tkeep_previous,
                                &tlast_previous,
                                0, tvalid_i,
                                tuser_i, tkeep0_i,
                                tlast_i);
		// std::cout << "treset went high, resetting arrays and"
		// 	     " variables\n";
	}
	// If treset is not high, run algorithm as usual
	else {
		// If tready is high, run algorithm as usual
		if (tready_i) {
			// If the tvalid and tkeep signals are high,
			// run the algorithm as usual
			short sum = 0;
			short mult;
			if (tvalid_i && tkeep0_i && tkeep1_i) {

				sum_loop: for (short i = N_TAP - 1; i >= 0; i--) {
				        // Add the register values * their respective
				        // coefficients to the sum variables
				        if (i == N_TAP - 1) {
				            mult = tdata_i*fir_coeffs[0];
				            sum += mult;
				            // sum += tdata_i*fir_coeffs[0];
				        }

				        else {
				            mult = tap_array[i]*fir_coeffs[i+1];
				            sum += mult;
				            // sum += tap_array[i]*fir_coeffs[i+1];
				        }

				        if (channel_count == 63) {
				        	std::cout << "sum before tap_array["
				        			  << i << "]*fir_coeffs[" << i
									  << "+1]: " << sum << "\n";
				        	std::cout << "tap_array["
				        			  << i << "] " << tap_array[i]
				        			  << " | coefficient: " << fir_coeffs[i+1] << "\n";
				        }
				}

				// Move each input up one element in
				// the SSR array.
				// Subsequently, add each new array
				// element * the respective
				// coefficient to the total sum.
				register_loop: for (short i = N_TAP - 1;
				     i >= 0; i--) {
					// On final iteration set
					// the first D register to
					// the input
					if (i == 0) {
						tap_array[i] =
						tdata_i;
					}
					// Move up the other registers
					else {
						tap_array[i] =
						tap_array[i-1];
					}
				}
			// End of FIR mechanism
			}

			// Output assignment (sum to FIR tdata output)
			output_assign(sum, &(*tdata_o),
                                      tvalid_i, &(*tvalid_o), tuser_i,
                                      &(*tuser_o), tkeep0_i, &(*tkeep0_o),
                                      tkeep1_i, &(*tkeep1_o), treset_i,
                                      &(*treset_o), tlast_i, &(*tlast_o));

			// Previous assignments for when tready goes low
			previous_assign(&tdata_previous,
                                	&tvalid_previous,
                                	&tuser_previous,
                                	&tkeep_previous,
                                	&tlast_previous,
                                	sum, tvalid_i,
                                	tuser_i, tkeep0_i,
                                	tlast_i);

			// SSR of D registers several clk's after
			// tlast to prevent complications on the next
			// packet.
			if (tlast_reset) {
				// std::cout << "tlast went high, wipe "
				// 	     "delay active\n";
				// Increase clock delay counter
				restore_count++;
				// If the limit is reached, reset and restore
				// variables
				if (restore_count == WIPE_DELAY) {
					// std::cout << "Wipe delay over, tlast"
					// 	     " restore active\n";
					tlast_reset = false;
					restore_count = 0;

					// Fully partitioned proxy array for SSR
					// short partitioned_store_proxy[N_TAP];
					// short partitioned_load_proxy[N_TAP];


					// proxy_loop: for (short i = 0; i < N_TAP; i++) {
					// 	partitioned_store_proxy[i] = tap_array[i];

						// if (channel_count == 63) {
							// partitioned_load_proxy[i] = master_SSR[0][i];
						// }

						// else {
							// partitioned_load_proxy[i] =
							// master_SSR[channel_count+1][i];
						// }

					// }

					// SSR takes place here.
					// Hopefully using master_ssr array
					SSR_loop: for (short i = 0; i < N_TAP; i++) {
						// Current packet's tap
						// values are saved.
						// Next packet's values
						// are restored to the tap
						// array



						master_SSR[channel_count][i] = tap_array[i];

						if (channel_count == 63) {
							tap_array[i] = master_SSR[0][i];
						}

						else {
							tap_array[i] = master_SSR[channel_count+1][i];
						}

						// master_SSR[channel_count][i] =
						// partitioned_store_proxy[i];

						// tap_array[i] =
						// partitioned_load_proxy[i];

						// This didn't work, try following rest of solution
						// page in skype
					}

					// std::cout << "master_SSR[" <<
					// 	     channel_count
					// 	  << "]: \n";
					// for (short i = 0; i < N_TAP; i++) {
					// 	std::cout <<
					// 	master_SSR[channel_count][i]
					// 	<< " ";
					// }

					// std::cout << "\n";

					channel_count++;

					if (channel_count > 63) {
						channel_count = 0;
					}
				}
			}
			// Begin tlast restore delay counting
			if (tlast_i && tuser_i) {
				tlast_reset = true;
			}
		// End of tready if bracket
		}

		// If tready is low, output the signals from the clk cycle
		// just before tready went low, until tready goes high again.
		// Do not run algorithm as normal.
		else {
			std::cout << "tready low, outputting previous "
				     "values\n";
			output_assign(tdata_previous, &(*tdata_o),
                                          tvalid_previous, &(*tvalid_o),
                                          tuser_previous, &(*tuser_o),
                                          tkeep_previous, &(*tkeep0_o),
                                          tkeep_previous, &(*tkeep1_o),
                                          treset_i, &(*treset_o),
                                          tlast_previous, &(*tlast_o));
		}
	// End of treset else bracket
	}

	// Print scaffolding
	// std::cout << "tap_array: \n";
	// for (short i = 0; i < N_TAP; i++) {
	// 	std::cout << tap_array[i] << " ";
	// 	if (i % 8 == 0) {
	// 		std::cout << "\n";
	// 	}
	// }
	// std::cout << "\n";
	// std::cout << "tdata output: " << *tdata_o << "\n";
}

// End of unused functions zone //////////////////////////////////////////////

void fir_HLS_simplified(short tdata_i, short* tdata_o,
             		bool tvalid_i, bool* tvalid_o, bool tuser_i,
			bool* tuser_o, bool tkeep0_i, bool* tkeep0_o,
			bool tkeep1_i, bool* tkeep1_o, bool tready_i,
			bool treset_i, bool* treset_o, bool tlast_i,
			bool* tlast_o) {
	// Simplified FIR function to work towards a working modelsim output
	// Removed SSR mechanism

	// static short tdata_previous;

	// static bool array_bool;

	// static bool tlast_reset, tvalid_previous,
	// 		tuser_previous, tkeep_previous,
	// 		tlast_previous;

	static short tdata_previous[CLK_REC];
	static bool tvalid_previous[CLK_REC], tuser_previous[CLK_REC],
				tkeep_previous[CLK_REC], tlast_previous[CLK_REC];

	static char restore_count;

	static bool tlast_reset;

		if (tready_i || treset_i) {

			if (treset_i) {

					tlast_reset = false;
					// array_bool = true;
					restore_count = 0;

					reset_loop: for (short i = N_TAP - 1; i >= 0; i--) {
						tap_array[i] = 0;
					}

					output_assign(0, &(*tdata_o),
			                              tvalid_i, &(*tvalid_o), tuser_i,
			                              &(*tuser_o), tkeep0_i, &(*tkeep0_o),
			                              tkeep1_i, &(*tkeep1_o), treset_i,
			                              &(*treset_o), tlast_i, &(*tlast_o));

					previous_reset: for (short i = CLK_REC - 1; i >= 0; i--) {
						tdata_previous[i] = 0;
						tvalid_previous[i] = tvalid_i;
						tuser_previous[i] = tuser_i;
						tkeep_previous[i] = tkeep0_i;
						tlast_previous[i] = tlast_i;
					}

			        // previous_assign(&tdata_previous,
			        // 				&tvalid_previous,
					// 				&tuser_previous,
					// 				&tkeep_previous,
					// 				&tlast_previous,
					// 				0, tvalid_i,
					// 				tuser_i, tkeep0_i,
					// 				tlast_i);

			}

			else {
				short sum = 0;
				short mult;

				if (tvalid_i && tkeep0_i && tkeep1_i) {

					register_loop: for (short i = N_TAP - 1; i >= 0; i--) {
										// Introduce new input to first register
										if (i==0) {
											tap_array[i] = tdata_i;
										}
										// Move all other values up one register
										else {
											tap_array[i] = tap_array[i-1];
										}

										mult = tap_array[i]*fir_coeffs[i];
										sum += mult;
					}
					// End of FIR mechanism
				}

				output_assign(sum, &(*tdata_o),
                              tvalid_i, &(*tvalid_o), tuser_i,
                              &(*tuser_o), tkeep0_i, &(*tkeep0_o),
                              tkeep1_i, &(*tkeep1_o), treset_i,
                              &(*treset_o), tlast_i, &(*tlast_o));

				previous_assign: for (short i = CLK_REC - 1; i >= 0; i--) {
					if (i == 0) {
						tdata_previous[i] = sum;
						tvalid_previous[i] = tvalid_i;
						tuser_previous[i] = tuser_i;
						tkeep_previous[i] = tkeep0_i;
						tlast_previous[i] = tlast_i;
					}

					else {
						tdata_previous[i] = tdata_previous[i-1];
						tvalid_previous[i] = tvalid_previous[i-1];
						tuser_previous[i] = tuser_previous[i-1];
						tkeep_previous[i] = tkeep_previous[i-1];
						tlast_previous[i] = tlast_previous[i-1];
					}
				}

			// previous_assign(&tdata_previous,
            //                	&tvalid_previous,
            //                	&tuser_previous,
            //                	&tkeep_previous,
            //                	&tlast_previous,
            //              	sum, tvalid_i,
            //              	tuser_i, tkeep0_i,
            //               	tlast_i);

			
				if (tlast_reset) {
					// std::cout << "tlast went high, wipe "
					// 	     "delay active\n";
					restore_count++;

					if (restore_count == WIPE_DELAY) {
						tlast_reset = false;
						restore_count = 0;

						reset_loop2: for (short i = N_TAP - 1; i >= 0; i--) {
							tap_array[i] = 0;
						}
					}
				}

				if (tlast_i && tuser_i) {
					tlast_reset = true;
				}
				// End of tready if bracket
			}
		}

		else {
				// tready scaffolding
				// std::cout << "\n\n";
				// for (short i = CLK_REC - 1; i >= 0; i--) {
				// 	std::cout << "tdata_previous[" << i << "]:"
				// 			  << tdata_previous[i] << "\n";
				// }

				output_assign(tdata_previous[CLK_REC-1], &(*tdata_o),
                              tvalid_previous[CLK_REC-1], &(*tvalid_o),
                              tuser_previous[CLK_REC-1], &(*tuser_o),
                              tkeep_previous[CLK_REC-1], &(*tkeep0_o),
                              tkeep_previous[CLK_REC-1], &(*tkeep1_o),
                              treset_i, &(*treset_o),
                              tlast_previous[CLK_REC-1], &(*tlast_o));

				// output_assign(tdata_previous[CLK_REC - 1], &(*tdata_o),
				// 			  false, &(*tvalid_o), false, &(*tuser_o),
				// 			  false, &(*tkeep0_o), false, &(*tkeep1_o),
				// 			  treset_i, &(*treset_o), false, &(*tlast_o));
		// End of tready else statement
		}
}

void fir_HLS_SSR(ap_fir_SSR_in s_axis_data, ap_fir_hls_out* m_axis_data) {

	// Booleans to indicate active tlast delay period
	static bool delay_flag, delay_flag1, delay_flag2, array_bool;

	static short tdata_previous;
	static bool tvalid_previous, tuser_previous, tkeep_previous, tlast_previous;

	// Sum to be added to and then written to *tdata_o
	static short sum;

	short tdata_input = s_axis_data.tdata;
	bool tvalid_input = s_axis_data.tvalid;
	ap_uint<2> tkeep_input = s_axis_data.tkeep;
	bool tuser_input = s_axis_data.tuser;
	bool tlast_input = s_axis_data.tlast;
	bool tready_input = m_axis_data->tready;

	// Temporary counter to circumvent pipelining issues
	// ADC_t is 12 bits signed
	char channel_temp = channel_count;

	// Run block as normal if tready is high
	if (tready_input) {
		// Active delay period before variable restore
		if (delay_flag) {
			if (delay_flag1) {
				if (delay_flag2) {
					// Restore taps and reset counters
					restore_loop: for (short i = N_TAP - 1; i >= 0; i--) {
										tap_array[i] = SSR_temp[i];
										tap_array1[i] = SSR_temp[i];
					}

					sample_count0 = 0;
					sample_count1 = 0;
					delay_flag = delay_flag1 = delay_flag2 = false;

					// Change channel count
					if (channel_count == 63) {
						channel_count = 0;
					}

					else {
						channel_count++;
					}
				}
				delay_flag2 = true;
			}
			delay_flag1 = true;
		}

		// Run algorithm and SSR as usual
		else if (tvalid_input && tkeep_input == 3) {

			reg_shift_sum(&array_bool, tap_array, tap_array1, tdata_input,
						  &sum);
			// SSR mechanism (RAW memory access)
			// If processing latter half of packet (32nd to 63rd values)
			// start to save tdata_i to SSR array
			if (sample_count0 >= N_TAP) {
				SSR_main[channel_temp][N_TAP-sample_count1 - 1] =
				tdata_input;
				// Add to index counter
				sample_count1++;
			}

			// During former half (0th to 31st values) read from SSR
			// array into SSR registers for restoration once tlast_i
			// goes high
			else {
				// Pipeline workaround
				if (channel_temp == 63) {
					// So that channel_temp + 1 = 0
					channel_temp = -1;
				}

				SSR_temp[sample_count0] =
				SSR_main[channel_temp+1][sample_count0];
			}

			// std::cout << "Sample count: " << sample_count << "\n";

			// Add to sample counter
			sample_count0++;

			// If tlast and tuser go high, begin restore countdown
			if (tlast_input && tuser_input) {
				delay_flag = true;
			}
			// End of FIR mechanism
		}
		// Drive output values
		m_axis_data->tdata = tdata_previous = sum;
		m_axis_data->tkeep = tkeep_previous = tkeep_input;
		m_axis_data->tvalid = tvalid_previous = tvalid_input;
		m_axis_data->tuser = tuser_previous = tuser_input;
		m_axis_data->tlast = tlast_previous = tlast_input;
	}

	else {
		m_axis_data->tdata = tdata_previous;
		m_axis_data->tkeep = tkeep_previous;
		m_axis_data->tvalid = tvalid_previous;
		m_axis_data->tuser = tuser_previous;
		m_axis_data->tlast = tlast_previous;
	}
}

void fir_HLS_axi4s_simplified(ap_axi4s_fir* tdata_i, ap_axi4s_fir* tdata_o) {

	short tdata_input = tdata_i->data;
	ap_uint<2> tkeep_input = tdata_i->keep;
	bool tlast_input = tdata_i->last;
	// bool tuser_input = tdata_i->user;
	
	// Boolean to indicate active tlast delay period
//	static bool delay_bool;

//	ADC_t channel_temp = channel_count;

//	static short sum;

//	if (delay_bool) {
//		restore_count++;
		// End of tlast delay
//		if (restore_count == WIPE_DELAY) {
			// Restore taps and reset counters
//			restore_loop: for (short i = N_TAP - 1; i >= 0; i--) {
//				tap_array[i] = SSR_temp[i];
//			}

//			sample_count0 = 0;
//			sample_count1 = 0;
//			delay_bool = false;
//			restore_count = 0;
//			sum = 0;
			// Change channel count
//			if (channel_count == 63) {
//				channel_count = 0;
//			}

//			else {
//				channel_count++;
//			}
//		}
//	}

//	else if (tkeep_input == 3) {
		// SSR mechanism (RAW memory access)
		// If processing latter half of packet (32nd to 63rd values)
		// start to save tdata_i to SSR array
//		if (sample_count0 >= N_TAP) {
//			SSR_main[channel_temp][N_TAP-sample_count1 - 1] =
//			tdata_input;
			// Add to index counter
//			sample_count1++;
//		}

		// During former half (0th to 31st values) read from SSR
		// array into SSR registers for restoration once tlast_i
		// goes high
//		else {
			// Pipeline workaround
//			if (channel_temp == 63) {
				// So that channel_temp + 1 = 0
//				channel_temp = -1;
//			}

//			SSR_temp[sample_count0] =
//			SSR_main[channel_temp+1][sample_count0];
//		}

		// std::cout << "Sample count: " << sample_count << "\n";

		// Add to sample counter
//		sample_count0++;

// 		sum = 0;
// 		register_loop: for (short i = N_TAP - 1; i > 0; i--) {
			// Introduce new input to first register
			// sum += tap_array[i-1]*fir_coeffs_SSR_axis1[i];
// 			tap_array[i] = tap_array[i-1];

// 			if (i == 1) {
// 				tap_array[i-1] = tdata_input;
// 			}

			// Move all other values up one register
			// Add to sum once shifted
			// sum += tap_array[i]*fir_coeffs_SSR_axis1[i];
// 		}

// 		if (tlast_input) {
// 			delay_bool = true;
// 		}
//	}

	tdata_o->data = tdata_i->data;
	tdata_o->keep = tkeep_input;
	tdata_o->last = tlast_input;
	// tdata_o->user = tuser_input;
}


void fir_HLS(ap_fir_hls_in s_axis_data, ap_fir_hls_out* m_axis_data) {
	// Final function of project. Takes input from and sends output
	// to Kostas's SSR block.

	static short tdata_previous;
	static bool tvalid_previous, tuser_previous, tkeep_previous, tlast_previous;

	short tdata_input = s_axis_data.tdata;
	short tdata_SSR_input = s_axis_data.tdata_SSR;
	bool tvalid_SSR_input = s_axis_data.tvalid_SSR;
	bool tvalid_input = s_axis_data.tvalid;
	ap_uint<2> tkeep_input = s_axis_data.tkeep;
	bool tuser_input = s_axis_data.tuser;
	bool tlast_input = s_axis_data.tlast;
	bool tready_input = m_axis_data->tready;

	static bool delay_flag, delay_flag1, delay_flag2;
	static short sum;
	short reg_count;

	if (tready_input) {
		if (delay_flag) {
			SSR_temp[0] = tdata_SSR_input;
			if (delay_flag1) {
				if (delay_flag2) {
					restore_loop: for (short i = N_TAP - 1; i >= 0; i--) {
						tap_array[i] = SSR_temp[i];
						tap_array1[i] = SSR_temp[i];
					}

					delay_flag = false;
					delay_flag1 = false;
					delay_flag2 = false;
					sum = 0;
					sample_count0 = 0;
				}
				delay_flag2 = true;
			}
			delay_flag1 = true;
		}

		else if (tvalid_input && (tkeep_input == 3)) {
			reg_shift_sum(&array_bool, tap_array, tap_array1, tdata_input,
						     &sum);

			// Me and Gethin looked at the output. 7 values are right on the 2nd wave
			// and the 0th packet. On the 8th, i.e. when tap[0] of the restored tap is
			// finally multiplied by not zero, the output sum is wrong. The difference
			// Between the two outputs is 96, divided by 2 (the coeff) is 48. This is also
			// the case for 8 samples later. The output difference is 13*48. 48 is the bad one.
			//  This means that
			// SSR_temp[0] is restored incorrectly, but the rest of the values are fine.
			// We need to find out why SSR_temp[0] is shagged. It's probably because I start
			// saving values one clock too early or too late. Play with that.
			if (tvalid_SSR_input || sample_count0 < 2*N_TAP) {
				SSR_temp[2*N_TAP - sample_count0] = tdata_SSR_input;
			}
			sample_count0++;

			if (tuser_input && tuser_input) {
				delay_flag = true;
			}
		}

		m_axis_data->tdata = tdata_previous = sum;
		m_axis_data->tkeep = tkeep_previous = tkeep_input;
		m_axis_data->tvalid = tvalid_previous = tvalid_input;
		m_axis_data->tuser = tuser_previous = tuser_input;
		m_axis_data->tlast = tlast_previous = tlast_input;
	}

	else {
		m_axis_data->tdata = tdata_previous;
		m_axis_data->tkeep = tkeep_previous;
		m_axis_data->tvalid = tvalid_previous;
		m_axis_data->tuser = tuser_previous;
		m_axis_data->tlast = tlast_previous;
	}
}


void array_scan_fir(short tdata_stored[N_SA],
		    bool tvalid_stored[N_SA], bool tuser_stored[N_SA],
		    bool tlast_stored[N_SA], bool tkeep_stored[N_SA],
		    short tdata_output[N_SA], int input_seed, int treset_limit,
		    int tready_low_limit, int tready_high_limit, bool simplified) {
	// This function scans the arrays from the output of data_read
	// after it processes the input file, and feeds the data to fir_HLS,
	// saving the tdata output.
	
	// Make sure tready is initially low to prevent backpressure
	bool tready = true;
	// Make sure treset is initially low to prevent infinite loop
	bool treset = false;
	bool first_iter = true;

	// Counter for while loop
	int i = 0;
	int attempt = 1;
	int tlast_delay = 0;

	// Setup for random backpressure and reset
	int random_seed;

	set_rnd_seed(input_seed, random_seed);

	// Algorithm scan while loop, executes until iterator reaches index
	// of the last value in the data arrays. Iterator doesn't always
	// increase (can revert back to i = 0, or i--)
	array_scan: while (i < N_SA) {
		
		// Random assign for tready and treset
		// random_signal(treset, 1, treset_limit, 1, random_seed);
		random_signal(tready, 1, tready_low_limit, 1,
                                          random_seed);

		if (tuser_stored[i] && tlast_stored[i]) {
			tready = true;
		}

		if (treset) {
			std::cout << "\ntreset went high, "
                                     "for iteration "
                                  << i << " "
                                     "so entire process "
                                     "will be reset.\n"
                                  << "Attempt " << attempt
                                  << " has ended.\n";
			i = 0;
			attempt++;
			treset = false;
			tlast_delay = 0;
		}
		// If treset is not high, run scan as usual
		else {
			// Initialising temporary signal booleans for
			// the synthesis ports

			// Temporary output variable for FIR output
			short tdata_out;
			bool tvalid_out;
			ap_axi4s_fir tdata_i_struct, tdata_o_struct;
			ap_fir_hls_in tdata_i_group;
			ap_fir_SSR_in tdata_i_group1;
			ap_fir_hls_out tdata_o_group;
			
			if (i == 0 && first_iter) {
				treset = true;
            }

			if (tuser_stored[i] && tlast_stored[i] &&
			   (tlast_delay > 0)) {
				tdata_i_struct.last
				= false;
				tdata_i_struct.keep = 0;
				tdata_i_group.tuser = tdata_i_group1.tuser =
				tdata_i_group.tlast = tdata_i_group1.tlast =
				tdata_i_group.tvalid = tdata_i_group1.tvalid = false;
				tdata_i_group.tkeep = tdata_i_group1.tkeep = 0;

			}

			else {
				tdata_i_struct.last = tlast_stored[i];
                tdata_i_struct.keep = 3;
                tdata_i_group.tuser = tdata_i_group1.tuser = tuser_stored[i];
                tdata_i_group.tlast = tdata_i_group1.tlast = tlast_stored[i];
                tdata_i_group.tkeep = tdata_i_group1.tkeep = 3;
                tdata_i_group.tvalid = tdata_i_group1.tvalid = tvalid_stored[i];
            }

			if (i == L_CHK) {
			 	std::cout << "Tap array for line " << i
					  << " before block:\n";
				for (short j = 0; j < N_TAP; j++) {
					std::cout << tap_array[j] << " ";
					if (j % 8 == 0) {
						std::cout << "\n";
					}
				}

				std::cout << "\n";

				std::cout << "Tap array1 for line " << i
						  << " before block:\n";
				for (short j = 0; j < N_TAP; j++) {
					std::cout << tap_array1[j] << " ";
					if (j % 8 == 0) {
						std::cout << "\n";
					}
				}

				std::cout << "\n";

				std::cout << "Tap product for line " << i
						  << " before block:\n";
				for (short j = 0; j < N_TAP; j++) {
					std::cout << tap_array[j]*fir_coeffs[j] << " ";
					if (j % 8 == 0) {
						std::cout << "\n";
					}
				}

				std::cout << "\n";

				std::cout << "Tap product1 for line " << i
						  << " before block:\n";
				for (short j = 0; j < N_TAP; j++) {
					std::cout << tap_array1[j]*fir_coeffs[j] << " ";
					if (j % 8 == 0) {
						std::cout << "\n";
					}
				}

				std::cout << "\n";

				std::cout << "\nSSR_main for same line: \n";

				for (short j = 0; j < N_TAP; j++) {
					std::cout << SSR_main[channel_count][j] << " ";
					if (j % 8 == 0) {
						std::cout << "\n";
					}
				}

				std::cout << "\n";

				std::cout << "tdata_input: " << tdata_stored[i];
			}

			if (simplified) {
				// fir_HLS_simplified(tdata_stored[i], &tdata_out, tvalid_i,
				// &tvalid_out, tuser_i, &tuser_out,
				// tkeep_stored[i], &tkeep_out, tkeep_stored[i],
				// &tkeep_out, tready, treset, &treset_out,
				// tlast_i, &tlast_out);
				tdata_i_struct.data = tdata_stored[i];

				fir_HLS_axi4s_simplified(&tdata_i_struct, &tdata_o_struct);

				tready = true;
				tvalid_out = tvalid_stored[i];
				tdata_out = tdata_o_struct.data;
				// tuser_out = tdata_o_struct.user;
				// treset_out = treset;
				// tlast_out = tdata_o_struct.last;
			}

			else {
				// fir_HLS_SSR_axi4s(tdata_stored[i], &tdata_out, tvalid_i,
				// 		&tvalid_out, tuser_i, &tuser_out,
				// 		tkeep_stored[i], &tkeep_out, tkeep_stored[i],
				// 		&tkeep_out, tready, treset, &treset_out,
				//		tlast_i, &tlast_out);

				tdata_o_group.tready = tready;
				tdata_i_group.tdata = tdata_i_group1.tdata = tdata_stored[i];

//				if (sample_count0 >= N_TAP + 1) {
//					SSR_main[channel_count][sample_count0-N_TAP-1] = tdata_stored[i];

//					if (channel_count == 63) {
//							tdata_i_group.tdata_SSR = SSR_main[0][sample_count0-N_TAP-1];
//					}

//					else {
//						tdata_i_group.tdata_SSR = SSR_main[channel_count + 1][sample_count0-N_TAP-1];
//					}

//					tdata_i_group.tvalid_SSR = true;
//				}

				// fir_HLS(tdata_i_group, &tdata_o_group);
				fir_HLS_SSR(tdata_i_group1, &tdata_o_group);

				tvalid_out = tdata_o_group.tvalid;
				tdata_out = tdata_o_group.tdata;
			}

			if (i == L_CHK) {
                                std::cout << "Tap array for line " << i
                                          << " after block:\n";
                                for (short i = 0; i < N_TAP; i++) {
                                      std::cout << tap_array[i] << " ";
                                        if (i % 8 == 0) {
                                                std::cout << "\n";
                                        }
                                }
                                
                                std::cout << "\n";

                                std::cout << "Tap array1 for line " << i
                                		  << " after block:\n";
                                for (short j = 0; j < N_TAP; j++) {
                                	std::cout << tap_array1[j] << " ";
                                	if (j % 8 == 0) {
                                		std::cout << "\n";
                                	}
                                }

                				std::cout << "\n";

                				std::cout << "Tap product for line " << i
                						  << " after block:\n";
                				for (short j = 0; j < N_TAP; j++) {
                					std::cout << tap_array[j]*fir_coeffs[j] << " ";
                					if (j % 8 == 0) {
                						std::cout << "\n";
                					}
                				}

                				std::cout << "\n";

                				std::cout << "Tap product1 for line " << i
                						  << " after block:\n";
                				for (short j = 0; j < N_TAP; j++) {
                					std::cout << tap_array1[j]*fir_coeffs[j] << " ";
                					if (j % 8 == 0) {
                						std::cout << "\n";
                					}
                				}

                				std::cout << "\n";

                				std::cout << "\nSSR_main for same line: \n";

                				for (short j = 0; j < N_TAP; j++) {
                					std::cout << SSR_main[channel_count][j] << " ";
                					if (j % 8 == 0) {
                						std::cout << "\n";
                					}
                				}

                                std::cout << "\n";
                				std::cout << "channel_count and restore_count after"
                							 " block: " << channel_count << " | "
                							 << restore_count << " \n";
                				std::cout << "and tdata output: " << tdata_out << "\n";
            }


			if (tvalid_out) {
				tdata_output[i] = tdata_out;
			}

			if (i == 0) {
				treset = false;
			}
	
			if (tlast_stored[i] && tuser_stored[i]) {
				if (tlast_delay < WIPE_DELAY) {
					tlast_delay++;
					i--;
				}
			
				else {
					tdata_i_group.tvalid_SSR = false;
					tlast_delay = 0;
					// if (channel_count == 63) {
					// 	channel_count = 0;
					// }

					// else {
					// 	channel_count++;
					// }
					std::cout << "Channel count is now "
						  << channel_count << " on "
						  << "line " << i << "\n";
				}
			}

			// If tready is high, revert to previous loop
			// and check if tready is still high, recursive
			// until tready is low, then scan as usual.
			if (!tready) {
				// Iterator for while loop does not increase,
				// process same line again
			    std::cout << "\nLine " << i <<
                                            " had a low tready "
                                            "during attempt " << attempt
                                            << " so pointer will return to "
                                            "that line and reattempt the "
                                            "scan \n";
                               random_signal(tready, 1, tready_high_limit, 1,
                                                            random_seed);
			}

			// else if (first_iter) {
			// 	std::cout << "\n First iteration, treset goes high to"
			// 			     " prep the algorithm, i does not increase.\n";
			// 	first_iter = false;
			// }

			else {
				// Iterator increases if tready is high
				i++;
			}
		}	
	}
	std::cout << "End of scan at line " << i << ".\n\n";
}


bool fir_testbench(const std::string& input_file,
		   const std::string& output_file, short tdata_stored[N_SA],
		   bool tvalid_stored[N_SA], bool tuser_stored[N_SA],
		   bool tlast_stored[N_SA], bool tkeep_stored[N_SA],
		   short tdata_output[N_SA], int input_seed, int treset_limit,
		   int tready_low_limit, int tready_high_limit, bool simplified,
		   bool auto_pass) {
	// This function reads the input file and feeds the data to fir_HLS
	// so that we can compare the model sw output to our output.
	
	int count;

	data_read(input_file, count, tdata_stored, tvalid_stored,
		  tuser_stored, tlast_stored, tkeep_stored);


	array_scan_fir(tdata_stored, tvalid_stored, tuser_stored,
		       tlast_stored, tkeep_stored, tdata_output, input_seed,
		       treset_limit, tready_low_limit, tready_high_limit, simplified);

	short tdata_validated[N_SA];

	if (auto_pass) {
		bool temp_bool;
		temp_bool = ADC_compare(output_file, tdata_output, tdata_validated);
		return 0;
	}

	else {
		return ADC_compare(output_file, tdata_output, tdata_validated);
	}
}
