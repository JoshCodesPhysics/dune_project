#include <iostream>
#include "functions.h"

void ped_alg(word_t& ped_val, char& accum, word_t& ADC,
		     word_t tdata, bool tvalid, bool tkeep0,
			 bool tkeep1, bool tready) {
	// This function takes an input ped_val, the estimate or previous
	// pedestal (median) value, and can adjust this value according
	// to whether the input ADC value is larger or smaller for a given
	// number of iterations.
	//
	// The input booleans are signal ports for the running conditions of
	// the algorithm. These will be simulated and input by ped_sub().
	//
	// The accumulator value (accum) begins at 0, but
	// if 'ADC[i] >(<) ped_est' -> 'accum +(-) 1'. Then if accum reaches
	// +(-) 10, the new pedestal value (ped) +(-) 1 and the accum value is
	// reset to zero. This will be performed by a top function outside of
	// ped_alg, whose only purpose is to output new pedestal, accumulator
	// and ADC values.

	// Run if no back pressure from tready, and the tvalid and tkeep
	// signals are high.
	if (!tready && tvalid && tkeep0 && tkeep1) {

		//Extracting 12 bit ADC value from 16 bit word
		int mask = 4095;

		word_t trunc = mask & tdata;

		ADC = trunc;

		// Running logic to change accumulator and/or pedestal
		accumulator_condition : {
			if (ADC > ped_val) {
				accum++;
			}

			else if (ADC < ped_val) {
				accum--;
			}
		}

		pedestal_condition : {
			if (accum >= 10) {
				ped_val++;
				accum = 0;
			}

			else if (accum <= -10) {
				ped_val--;
				accum = 0;
			}
		}

		// Subtract the pedestal from the original value and assign it
		// to the placeholder variable

		ped_subtraction: {
				ADC = ADC - ped_val;
		}
	}
}

void ped_sub(word_t ped_val, int packet_size, word_t* packet,
		    bool& tvalid, bool& tkeep0, bool& tkeep1, bool& tready,
			bool& tlast, bool& tuser) {
	// N new ADC samples are stored in array index range
	// 0 -> N - 1, the accumulator is then stored at index N,
	// then final pedestal value stored at the
	// end of the array at index N+1, so uniform datatype
	// can be returned from this function. New array hence contains
	// N + 2 entries. Remember to truncate array if you want
	// either ADC_new, accum or ped_new.
	
	// Defining new ADC vector, starting with pedestal estimate
	// value; looping through the original ADC values and applying
	// the algorithm. Note that accum starts at zero.

	// Defining the loop variables
	char accum = 0;
	word_t ped_new = ped_val;
	word_t ADC_temp;
	int i = 0;

	// Simulating the signal booleans

	tuser = false;
	tlast = false;
	tready = false;

	// While we have not reached the end of the frame or packet,
	// scan the ADC values and adjust them accordingly
	// (as well as the pedestal and accumulator).
	ADC_scan: while (!tlast && !tuser) {

		if (i == 0) {
			tvalid = true;
			tkeep0 = tvalid;
			tkeep1 = tkeep0;
		}

		word_t temp_word = packet[i];

		ped_alg(ped_new, accum, ADC_temp, temp_word,
				tvalid, tkeep0, tkeep1, tready);

		packet[i] = ADC_temp;

		// End of frame or packet, cancel next loop.
		if (i == packet_size - 1) {
			tuser = tlast = true;
		}

		i++;
		ADC_temp = 0;

	}

	tuser = tlast = false;

	// Writing final accumulator and pedestal values to the end of the
	// array.

	packet[packet_size] = accum;
	packet[packet_size + 1] = ped_new;
}


// Following random number generator is from christianpinder.com blog
// referencing a Park and Miller paper on the topic.

void set_rnd_seed(int new_seed, int& rnd_seed) {
    rnd_seed = new_seed;
}

void rand_int(int& rnd_seed) {
    int k1;
    int ix = rnd_seed;

    k1 = ix / 127773;
    ix = 16807 * (ix - k1 * 127773) - k1 * 2836;
    if (ix < 0)
        ix += 2147483647;
    rnd_seed = ix;
}
