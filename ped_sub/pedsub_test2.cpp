#include <iostream>
#include "functions.h"

// This testbench employs the ped_sub_read function to process an input
// text file and see if the ped_alg function generates the expected
// final pedestal value from the ADC values and signal booleans
// written in the input file.

int main() {

	// String containing name of the input file
        std::string input_file = "packet_data_adjusted.txt";

	// Number of packets within the input file and the number of
	// samples contained in each packet.
        int num_packets = 10;
        int packet_size = 64;

	// Verified correct pedestal value after enough packets
	// have entered the channel
	word_t const converge_value = 501;

	// Empty arrays to contain the results.
        word_t ped_array[num_packets];
        char accum_array[num_packets];
        word_t ADC_array[num_packets*packet_size];

	// Pedestal estimate; can affect testbench outcome
        word_t ped_val = 475;

	// Empty ADC and signal variables to be assigned during
	// algorithm
        word_t ADC;
        bool tvalid, tkeep0, tkeep1, tlast, tuser, tready;

	std::cout << "Running algorithm on input file: \n\n";

	// Calling testbench function, which in turn calls ped_alg
        ped_sub_read(input_file, ped_val, num_packets, ped_array,
                     ADC_array, accum_array, packet_size, tvalid,
                     tkeep0, tkeep1, tready, tlast, tuser);
	
	std::cout << "\n\nFinal pedestal and accumulator results: "
		  << "\n\n";
        
	// Printing the final pedestal and accumulator values
	// for each packet
	for (int i = 0; i < num_packets; i++) {
		std::cout << "Pedestal for packet " << i <<
                             ": " << ped_array[i] << "\n";
                printf("Accumulator for the same packet: %d\n",
                       accum_array[i]);
        }

	// Instantaneous success condition: If the final pedestal
	// value equals the verified convergent value
	bool equal_condition = (ped_array[num_packets - 1]
			        == converge_value);

	std::cout << "\n\nTesting condition... \n";

	// Testbench returns a success
	if (equal_condition) {
		std::cout << "Final pedestal estimate after packet "
			  << num_packets << " equals the verified "
			  << "convergent value: " << converge_value
			  << "\n";
		return 0;
	}

	// Else, see if the value at least converges towards the
	// correct value
	else {
		std::cout << "\nVerified convergence value: "
			  << converge_value << "\n";
		
		// Low pedestal
		if (ped_val < converge_value) {
			// It does converge
			if ((ped_array[num_packets - 1]
			     - ped_array[0]) > 0) {
				std::cout << "Low pedestal value is "
				          << "increasing towards "
				          << "the verified "
				          << "convergence value."
					  << "\n";
				return 0;
			}
			
			// It doesn't
			else {
				std::cout << "Low pedestal value is not "
					  << "increasing towards the verified"
					  << " convergence value.\n";
				return 1;
			}
		}

		// High pedestal
		else {
			// It does converge
			if ((ped_array[num_packets - 1]
			     - ped_array[0]) < 0) {	
				std::cout << "High pedestal value is "
				          << "decreasing towards "
				          << "the verified "
				          << "convergence value.\n";
				return 0;
			}

			// It doesn't
			else {
				std::cout << "High pedestal value is "
				          << "not decreasing towards "
				          << "the verified "
				          << "convergence value.\n";
				return 1;
			}
		}

	}
}
