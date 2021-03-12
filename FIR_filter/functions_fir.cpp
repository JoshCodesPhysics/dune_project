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


void fir_HLS(short* ssr_current[N_TAP], short ssr_next[N_TAP],
	     short tdata_i, short* tdata_o,
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
	
	// Array to store the taps (D registers)
	static short tap_array[N_TAP];
	// tready restore and addition tree variable
	static short tdata_previous, sum;
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
		
		for (short i = 0; i < N_TAP; i++) {
			tap_array[i] = 0;
		}
		
		// Driving outputs regardless
		output_assign(tdata_i, &(*tdata_o),
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
                                	tdata_i, tvalid_i,
                                	tuser_i, tkeep0_i,
                                	tlast_i);
			
			// SSR of D registers several clk's after
			// tlast to prevent complications on the next
			// packet.
			if (tlast_reset) {
				// Increase clock delay counter
				restore_count++;
				// If the limit is reached, reset and restore
				// variables
				if (restore_count == WIPE_DELAY) {
					tlast_reset = false;
					restore_count = 0;
					sum = 0;
					// SSR takes place here.
					// Hopefully using master_ssr array
					for (short i = 0; i < N_TAP; i++) {
						// Current packet's tap
						// values are saved.
						// Next packet's values
						// are restored to the tap
						// array
						ssr_current[i] = tap_array[i];
						tap_array[i] = ssr_next[i];
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
}
