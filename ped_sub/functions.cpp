#include <iostream>
#include <vector>
#include "functions.h"
#include <random>
#include <algorithm>
#include <iterator>
#include <functional>

int_array ped_alg(int ped_est, int accum, int ADC) {
	// This function takes input ped_est, an estimate of the pedestal
	// (median) value, and adjusts this value according to whether
	// the input ADC value is larger or smaller.
	// The accumulator value (accum) begins at 0, but
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
	ADC_new = abs(ADC - ped_new);

	// Return list of new pedestal, new accumulator, and new ADC values
	return {ped_new, accum_new, ADC_new};
}

int_array ped_sub(int ped_val, int_array ADC_vals) {

	int accum = 0;

	// N new ADC samples are stored in array index range
	// 0 -> N - 1, the accumulator is then stored at index N,
	// then final pedestal value stored at the
	// end of the array at index N+1, so uniform datatype
	// can be returned from this function. New array hence contains
	// N + 2 entries. Remember to truncate array if you want
	// either ADC_new, accum or ped_new.
	
	// Defining new ADC vector, starting with pedestal estimate value;
	// loop through the original ADC values and apply the algorithm.
	int samples = ADC_vals.size();
	int new_dim = samples + 2;
	int_array ADC_new(new_dim);
	int ped_new = ped_val;
	int_array ped_vec;

	ADC_scan: for (int i = 0; i < samples; i++) {
		ped_vec = ped_alg(ped_new, accum, ADC_vals[i]);

		ped_new = ped_vec[0];
		accum = ped_vec[1];
		ADC_new[i] = ped_vec[2];
	}

	ADC_new[new_dim - 2] = accum;
	ADC_new[new_dim - 1] = ped_new;
	return ADC_new;
}

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

	
int_array GenerateRandomVector(int NumberCount, int minimum,
		                      int maximum) {
	
	// This function is just to provide a vector of random integer
	// vectors for the next function to take as input. Credit goes to
	// Caleth on Stackoverflow.
	std::random_device rd;
	
	std::mt19937 gen(rd()); // these can be global and/or static,
	// depending on how you use random elsewhere
	std::vector<int> values(NumberCount);

	std::uniform_int_distribution<> dis(minimum, maximum);
	
	std::generate(values.begin(), values.end(),
		      [&](){ return dis(gen); });
	
	return values;
}
