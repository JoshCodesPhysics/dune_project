#include <iostream>
#include "functions.h"

void ped_alg(int ped_est, int accum, int ADC, int* results) {
	// This function takes an input ped_est, the estimate of the pedestal
	// (median) value, and can adjust this value according to whether
	// the input ADC value is larger or smaller for a given number of
	// iterations.  The accumulator value (accum) begins at 0, but
	// if ADC[i] >(<) ped_est -> accum +(-) 1. Then if accum reaches
	// +(-) 10, the new pedestal value (ped) +(-) 1 and the accum value is
	// reset to zero. This will be performed by a top function outside of
	// ped_alg, whose only purpose is to output new pedestal, accumulator
	// and ADC values.

	int ped_new, accum_new, ADC_new;

	// Accumulator condition
	if (ADC > ped_est) {
	accum_new = accum + 1;
	}

	else if (ADC < ped_est) {
	accum_new = accum - 1;
	}

	else {
	accum_new = accum;
	}

	// pedestal condition
	if (accum_new >= 10) {
	ped_new = ped_est + 1;
	accum_new = 0;
	}

	else if (accum_new <= -10) {
	ped_new = ped_est - 1;
	accum_new = 0;
	}

	else {
	ped_new = ped_est;
	}

	// New ADC value has new pedestal value subtracted
	ADC_new = ADC - ped_new;

	// Fill empty results array.
	results[0] = ped_new;
	results[1] = accum_new;
	results[2] = ADC_new;

}

void ped_sub(int ped_val, int packet_size, int* ADC_vals) {
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

	int accum = 0;
	int ped_new = ped_val;
	int ped_results[3];

	ADC_scan: for (int i = 0; i < packet_size; i++) {
		ped_alg(ped_new, accum, ADC_vals[i], ped_results);

		// Recording output values for use in the next loop.
		ped_new = ped_results[0];
		accum = ped_results[1];
		// Adjusted ADC values replace the old ones
		ADC_vals[i] = ped_results[2];
	}

	// Writing final accumulator and pedestal values to the end of the
	// array.

	ADC_vals[packet_size] = accum;
	ADC_vals[packet_size + 1] = ped_new;
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

// Start of final top function to handle all channels, possibly not
// needed

// int_array ped_packets(rand_waves ADC_master, int_array ped_est,
//   		      int packets, int channels, int samples) {
        // This functions handles packet waves of ADC samples for a
        // number of channels, and stores the pedestal values between
        // each wave for each channel, returning a final integer array
        // of adjusted pedestal values for each channel. More packet
        // waves = better final pedestal values. For data types see
	// header file

	// int_array accum_vec(channels, 0);
	// int_array ped_vec(channels, 0)
	// rand_waves ADC_new(packets);
	// int i, j, k;

	// for (i = 0, i < packets, i++) {
	// 	ADC_new[i] = channel_array(channels);
