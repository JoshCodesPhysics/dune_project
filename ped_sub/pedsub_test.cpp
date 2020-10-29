#include <iostream>
#include "functions.h"
#include <vector>
#include <random>
#include <algorithm>
#include <iterator>
#include <functional>
#include <cmath>

int main() {
	
	// iterators
	int i, j, k;
	
	std::string endl = "\n";

	// Generating a vector containing the data-wave vectors that
	// contain the channel vectors that contain the packets of samples.
	
	// Defining the master vector (see header file for datatypes)
	wave_array rand_master(N_WAVES);

	// Appending random integer data packets to each channel in each wave
	packet_loop: for (i = 0; i < N_WAVES; i++) {
		rand_master[i] = channel_array(N_CHANNELS);
	 	channel_loop: for (j = 0; j < N_CHANNELS; j++) {
	 		rand_master[i][j] = int_array(N_SAMPLES);
			std::vector<int> temp_vec =
                        GenerateRandomVector(N_SAMPLES, R_MIN, R_MAX);

	 		sample_loop: for (k = 0; k < N_SAMPLES; k++) {
	 			rand_master[i][j][k] = temp_vec[k];
	 		}
	  	}
	}

	int_array ped_vec = ped_sub(PED_EST, rand_master[0][0]);
	// int_array ped_vec2 = ped_sub(PED_EST, rand_master[1][0]);
	
	result_loop: for (i = 0; i < N_SAMPLES + 2; i++) {
		if (i == N_SAMPLES) {
			std::cout << endl << "Initial pedestal value: "
				  << PED_EST << endl
				  << "Final accumulator value for " <<
				     "ADC packet is: " << ped_vec[i]
				     << endl;
	  		std::cout << "Final pedestal value for ADC " <<
	 			      "packet is: " << ped_vec[i + 1]
	  			      << endl;
			break;
	  	}

	  	else {
	  		std::cout << "New ADC value for index " << i <<
	  			     " is: " << ped_vec[i] << endl;
	  	}
	}

	std::cout << endl
		  << "Expected pedestal change: " << floor(N_SAMPLES/10)
		  << endl << "R_MIN: " << R_MIN << "  R_MAX: " << R_MAX
		  << "  N_SAMPLES: " << N_SAMPLES << endl;

	if (PED_EST < abs(R_MIN - floor(N_SAMPLES/10))) {
		std::cout << endl
			  << "Pedestal estimate input << ADC range, "
			  << "therefore pedestal should have increased"
			  << " by floor(N_SAMPLES/10) and the "
			  << "accumulator should be equal to N_SAMPLES"
			  << " % 10:" << endl;

		if ((ped_vec[N_SAMPLES + 1] == PED_EST + 
				               floor(N_SAMPLES/10)) &&
		    (ped_vec[N_SAMPLES] == N_SAMPLES % 10)) {

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
	
	else if (PED_EST > abs(R_MAX + floor(N_SAMPLES/10))) {
		std::cout << endl
			  << "Pedestal estimate input >> ADC range, "
			  << "therefore pedestal should have decreased"
			  << " by floor(N_SAMPLES/10) and the "
			  << "accumulator should be equal to -(N_SAMPLES"
			  << " % 10):" << endl;

		if ((ped_vec[N_SAMPLES + 1] == PED_EST - 
				               floor(N_SAMPLES/10)) &&
		    (ped_vec[N_SAMPLES] == -(N_SAMPLES % 10))) {

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
			  << " or < R_MIN "
			  << "- floor(N_SAMPLES/10). However it can still"
			  << " be used to observe the data regardless of "
			  << "the value of PED_EST." << endl;
		return 0;
	}
}
