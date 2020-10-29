#include <iostream>
#include <vector>
#include <random>
#include <algorithm>
#include <iterator>
#include <functional>

// Number of ADC samples per packet, number of channels
// (ADC arrays), number of data waves (number of times
// the array values are replaced with new ones):

#define N_SAMPLES 64
#define N_CHANNELS 10
#define N_WAVES 5

// Min and max values for the random integer array:

#define R_MIN 400
#define R_MAX 800

// Initial pre-algorithm pedestal value
#define PED_EST 810

// Defining data structures containing the ADC samples, channels and waves

typedef std::vector<int> int_array;
typedef std::vector<int_array> channel_array;
typedef std::vector<channel_array> wave_array;

// Declaring functions.
int_array ped_alg(int ped_est, int accum, int ADC);

int_array ped_sub(int ped_val, int_array ADC_vals);

int_array GenerateRandomVector(int NumberCount, int minimum,
                                      int maximum);
