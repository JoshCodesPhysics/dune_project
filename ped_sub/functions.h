#include <iostream>

// Number of ADC samples per packet, number of channels
// (ADC arrays), number of data waves (number of times
// the array values are replaced with new ones):

#define N_SAMPLES 64
#define N_CHANNELS 10
#define N_WAVES 5

// Min and max values for the random integer array:

#define R_MIN 400
#define R_MAX 800

// Initial pre-algorithm pedestal value:

// To properly utilise the testbench, set PED_EST
// to be either > R_MAX + floor(N_SAMPLES/10),
// or < R_MIN - floor(N_SAMPLES/10). However it can still
// be used to observe the data regardless of the value of PED_EST.
#define PED_EST 390

// Declaring functions.
void ped_alg(int& ped_val, int& accum, int& ADC);

void ped_sub(int ped_val, int packet_size, int* ADC_vals);

void set_rnd_seed(int new_seed, int& rnd_seed);

void rand_int(int& rnd_seed);
