#include <iostream>
#include "functions_fir.h"
// To import functions dealing with the same tready system
#include "../ped_sub/functions.h"
#include <fstream>
#include <string>
#include <sstream>

// Tap coefficients
short fir_coeffs[32] = {0,0,0,0,0,0,0,0,2,4,6,7,9,11,12,13,13,12,11,9,7,6,4,2,0,0,
		        0,0,0,0,0,0};

// Prospective SSR array
short master_SSR[2*N_TAP][N_TAP];

// Tap array
short tap_array[N_TAP];

// Channel counter for SSR top function
short channel_count;


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


void fir_HLS(short tdata_i, short* tdata_o,
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
	int sum = 0;
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
		sum = 0;
		channel_count = 0;
		for (short i = 0; i < N_TAP; i++) {
			tap_array[i] = 0;
			for (short j = 0; j < N_TAP*2; j++) {
				master_SSR[j][i] = 0;
			}
		}
		// Driving outputs regardless
		output_assign(sum, &(*tdata_o),
                              tvalid_i, &(*tvalid_o), tuser_i,
                              &(*tuser_o), tkeep0_i, &(*tkeep0_o),
                              tkeep1_i, &(*tkeep1_o), treset_i,
                              &(*treset_o), tlast_i, &(*tlast_o));

                previous_assign(&tdata_previous,
                                &tvalid_previous,
                                &tuser_previous,
                                &tkeep_previous,
                                &tlast_previous,
                                tdata_i, tvalid_i,
                                tuser_i, tkeep0_i,
                                tlast_i);
		std::cout << "treset went high, resetting arrays and"
			     " variables\n";
	}
	// If treset is not high, run algorithm as usual
	else {
		// If tready is high, run algorithm as usual
		if (tready_i) {
			// If the tvalid and tkeep signals are high,
			// run the algorithm as usual
			if (tvalid_i && tkeep0_i && tkeep1_i) {

				// Move each input up one element in
				// the SSR array.
				// Subsequently, add each new array
				// element * the respective
				// coefficient to the total sum. 
				for (short i = N_TAP - 1;
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
					
					// Addition tree represented by
					// this sum? Subject to change and
					// directives
					sum += tap_array[i]*
					       fir_coeffs[i];
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
				std::cout << "tlast went high, wipe "
					     "delay active\n";
				// Increase clock delay counter
				restore_count++;
				// If the limit is reached, reset and restore
				// variables
				if (restore_count == WIPE_DELAY) {
					std::cout << "Wipe delay over, tlast"
						     " restore active\n";
					tlast_reset = false;
					restore_count = 0;
					// SSR takes place here.
					// Hopefully using master_ssr array
					for (short i = 0; i < N_TAP; i++) {
						// Current packet's tap
						// values are saved.
						// Next packet's values
						// are restored to the tap
						// array
						master_SSR[channel_count][i] =
						tap_array[i];
						
						if (channel_count == 63) {
							tap_array[i] =
							master_SSR[0][i];
						}

						else {
							tap_array[i] =
							master_SSR[
							channel_count+1][i];
						}
					}

					std::cout << "master_SSR[" <<
						     channel_count
						  << "]: \n";
					for (short i = 0; i < N_TAP; i++) {
						std::cout << 
						master_SSR[channel_count][i]
						<< " ";
					}
					
					std::cout << "\n";

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

void array_scan_fir(short tdata_stored[N_SA],
		    bool tvalid_stored[N_SA], bool tuser_stored[N_SA],
		    bool tlast_stored[N_SA], bool tkeep_stored[N_SA],
		    short tdata_output[N_SA], int input_seed, int treset_limit,
		    int tready_low_limit, int tready_high_limit) {
	// This function scans the arrays from the output of data_read
	// after it processes the input file, and feeds the data to fir_HLS,
	// saving the tdata output.
	
	// Make sure tready is initially low to prevent backpressure
	bool tready = true;
	// Make sure treset is initially low to prevent infinite loop
	bool treset = false;

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
		random_signal(treset, 1, treset_limit, 1, random_seed);
		random_signal(tready, 1, tready_low_limit, 1,
                                          random_seed);

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
			bool tvalid_i, tuser_i, tlast_i, tvalid_out,
                             tuser_out, tkeep_out, tlast_out,
                             tready_out, treset_out;
			// Temporary output variable for FIR output
			short tdata_out;
			
			if (i == 0) {
                                treset = true;
                        }

			if (tuser_stored[i] && tlast_stored[i] &&
			   (tlast_delay > 0)) {
				tuser_i = tlast_i = tvalid_i = false;
			}

			else {
                                tuser_i = tuser_stored[i];
                                tlast_i = tlast_stored[i];
                                tvalid_i = tvalid_stored[i];
                        }

			if (i == 4097 || (i > 4107 && i < 4122)) {
				std::cout << "Tap array for line " << i
					  << " before block:\n";
				for (short i = 0; i < N_TAP; i++) {
					std::cout << tap_array[i] << " ";
					if (i % 8 == 0) {
						std::cout << "\n";
					}
				}

				std::cout << "\n";
			}

			fir_HLS(tdata_stored[i], &tdata_out, tvalid_i,
				&tvalid_out, tuser_i, &tuser_out,
				tkeep_stored[i], &tkeep_out, tkeep_stored[i],
				&tkeep_out, tready, treset, &treset_out,
				tlast_i, &tlast_out);

			if (i == 4118) {
                                std::cout << "Tap array for line " << i
                                          << " after block:\n"; 
                                for (short i = 0; i < N_TAP; i++) {
                                        std::cout << tap_array[i] << " ";
                                        if (i % 8 == 0) { 
                                                std::cout << "\n";
                                        }
                                }
                                
                                std::cout << "\n";
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
					tlast_delay = 0;
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
		   int tready_low_limit, int tready_high_limit) {
	// This function reads the input file and feeds the data to fir_HLS
	// so that we can compare the model sw output to our output.
	
	int count;

	data_read(input_file, count, tdata_stored, tvalid_stored,
		  tuser_stored, tlast_stored, tkeep_stored);


	array_scan_fir(tdata_stored, tvalid_stored, tuser_stored,
		       tlast_stored, tkeep_stored, tdata_output, input_seed,
		       treset_limit, tready_low_limit, tready_high_limit);

	short tdata_validated[N_SA];

	return ADC_compare(output_file, tdata_output, tdata_validated); 
}
