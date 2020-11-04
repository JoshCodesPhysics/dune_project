#include <iostream>
#include "functions.h"

// This testbench generates a number of random ADC values
// (between R_MIN and R_MAX) for a packet
// of sample size N_SAMPLES, transferred through a number of channels
// equal to N_CHANNELS, for a number of packet waves equal to N_WAVES.
// Currently only the 0th channel is being used to test the ped_sub
// algorithm from functions.cpp. To see if the algorithm works, select
// a PED_EST (pedestal estimate) value according to the conditions
// specified at the beginning of the main function where it is defined.

int main() {
	
	//Important constants, defined here due to required data type:

	// Number of ADC samples per packet, number of channels
	// (ADC arrays), number of data waves (number of times
	// the array values are replaced with new ones):

	int N_SAMPLES = 64;
	int N_CHANNELS = 10;
	int N_WAVES = 5;

	// Min and max values for the random integer array:

	int R_MIN = 400;
	int R_MAX = 800;

	// To properly utilise the testbench, set PED_EST
	// to be either > R_MAX + floor(N_SAMPLES/10),
	// or < R_MIN - floor(N_SAMPLES/10). However it can still
	// be used to observe the data regardless of the value of PED_EST.
	word_t PED_EST;
	PED_EST = 390;

	// iterators
	int i, j, k;
	
	std::string endl = "\n";

	// Generating a vector containing the data-wave vectors that
	// contain the channel vectors that contain the packets of samples.
	
	// Defining the master vector, see above for constant definitions.

	// We use N_SAMPLES + 2 so there is space for the accumulator and
	// pedestal values to be stored.
	word_t packet_array[N_WAVES][N_CHANNELS][N_SAMPLES + 2];

	// Defining a random number generator seed

	int rand_seed;
	set_rnd_seed((R_MAX + R_MIN)/2, rand_seed);

	// Appending random integer data packets to each channel in each wave
	packet_loop: for (i = 0; i < N_WAVES; i++) {
		channel_loop: for (j = 0; j < N_CHANNELS; j++) {
	 		sample_loop: for (k = 0; k < N_SAMPLES; k++) {
	 			rand_int(rand_seed);

	 			// Provides random values within our desired
				// range
	 			word_t rand_value;
	 			rand_value = R_MIN + (rand_seed
	 					 % (R_MAX - R_MIN + 1));
				
	 			packet_array[i][j][k] = rand_value;
	 		}
	  	}
	}

	// Copying random integers from the first packet of ch0
	// into test array to be adjusted.
	word_t test_array[N_SAMPLES + 2];

	for (i = 0; i < N_SAMPLES; i++) {
		test_array[i] = packet_array[0][0][i];
	}

	bool tvalid, tkeep0, tkeep1, tready, tlast, tuser;

	// Filling test array with adjusted ADC, accumulator
	// and pedestal values
	ped_sub(PED_EST, N_SAMPLES, test_array, tvalid,
			tkeep0, tkeep1, tready, tlast, tuser);

	// Printing results
	result_loop: for (i = 0; i < N_SAMPLES + 2; i++) {
		if (i == N_SAMPLES) {
			std::cout << endl << "Initial pedestal value: "
				  << PED_EST << endl
				  << "Final accumulator value for " <<
				     "ADC packet is: " << test_array[i]
				     << endl;
	  		std::cout << "Final pedestal value for ADC " <<
	 			      "packet is: " << test_array[i + 1]
	  			      << endl;
			break;
	  	}

	  	else {
	  		std::cout << "New ADC value for index " << i <<
	  			     " is: " << test_array[i] << endl;
	  	}
	}

	std::cout << endl
		  << "Expected pedestal change: " << (int)N_SAMPLES/10
		  << endl << "R_MIN: " << R_MIN << "  R_MAX: " << R_MAX
		  << "  N_SAMPLES: " << N_SAMPLES << endl;

	// Start of test bench logic, testing results. Subject to change.
	if (PED_EST < R_MIN - (int)N_SAMPLES/10) {
		std::cout << endl
			  << "Pedestal estimate input < ADC range - "
			  << "N_SAMPLES/10 " << endl
			  << "therefore pedestal should have increased"
			  << " by floor(N_SAMPLES/10) and the "
			  << endl
			  << "accumulator should be equal to N_SAMPLES"
			  << " % 10:" << endl;

		if ((test_array[N_SAMPLES + 1] == PED_EST +
				               (int)N_SAMPLES/10) &&
		    (test_array[N_SAMPLES] == N_SAMPLES % 10)) {

			std::cout << endl
				  << "Conditions satisfied, test passed!"
				  << endl;
			return 0;
		}

		else {
			std::cout << endl
				  << "Test failed, conditions not satisfied."
				  << endl;
			return 1;
		}
	}
	
	else if (PED_EST > R_MAX + (int)N_SAMPLES/10) {
		std::cout << endl
			  << "Pedestal estimate input > ADC range +"
			  << " N_SAMPLES/10, therefore pedestal should"
			  << " have decreased by floor(N_SAMPLES/10) and the "
			  << endl
			  << "accumulator should be equal to -(N_SAMPLES"
			  << " % 10):" << endl;

		if ((test_array[N_SAMPLES + 1] == PED_EST -
				               (int)N_SAMPLES/10) &&
		    (test_array[N_SAMPLES] == -(N_SAMPLES % 10))) {

			std::cout << endl
				  << "Conditions satisfied, test passed!"
				  << endl;
			return 0;
		}

		else {
			std::cout << endl
				  << "Test failed, conditions not satisfied."
				  << endl;
			return 1;
		}
	}

	else {
		std::cout << endl
			  << "To properly utilise this testbench, set PED_EST"
			  << " to be either"
	          << " > R_MAX + floor(N_SAMPLES/10),"
			  << " or < R_MIN - floor(N_SAMPLES/10)."
			  << endl
			  << "However it can still"
			  << " be used to observe the data regardless of "
			  << "the value of PED_EST." << endl;
		return 0;
	}
}
