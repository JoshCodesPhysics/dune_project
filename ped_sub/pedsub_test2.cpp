#include <iostream>
#include "functions.h"

// This testbench employs the ped_sub_read function to process an input
// text file and see if the ped_alg function generates the expected
// final pedestal value from the ADC values and signal booleans
// written in the input file.

int main() {

	// String containing full path of the input file
	// WILL NEED TO EDIT FOR YOUR PATH
	// Unfortunately relative path not possible due to Vivado
	// Csim
        const std::string input_file =
        		         "/home/joshhorswill10/Documents"
				 "/dune_project/ped_sub/"
			         "packet_data_adjusted.txt";

	// Number of packets within the input file and the number of
	// samples contained in each packet.
        const int NUM_PACKETS = 10;
        const int PACKET_SIZE = 64;

	// Verified correct pedestal value after enough packets
	// have entered the channel
	const word_t CONVERGE_VALUE = 501;

	// Empty arrays to contain the results.
        word_t ped_array[NUM_PACKETS];
        char accum_array[NUM_PACKETS];
        word_t ADC_array[NUM_PACKETS*PACKET_SIZE];

	// Pedestal estimate; can affect testbench outcome
        const word_t PED_VAL = 520;

	// Empty ADC and signal variables to be assigned during
	// algorithm
        word_t ADC;
        bool tvalid, tkeep0, tkeep1, tlast, tuser, tready;

	std::cout << "Running algorithm on input file: \n\n";

	// Calling testbench function, which in turn calls ped_alg
        ped_sub_read(input_file, PED_VAL, ped_array,
                     ADC_array, accum_array, tvalid,
                     tkeep0, tkeep1, tready, tlast, tuser);
	
	std::cout << "\n\nFinal pedestal and accumulator results: "
		  << "\n\n";
        
	// Printing the final pedestal and accumulator values
	// for each packet
	for (int i = 0; i < NUM_PACKETS; i++) {
		std::cout << "Pedestal for packet " << i <<
                             ": " << ped_array[i] << "\n";
                printf("Accumulator for the same packet: %d\n",
                       accum_array[i]);
        }

	// Instantaneous success condition: If the final pedestal
	// value equals the verified convergent value
	bool equal_condition = (ped_array[NUM_PACKETS - 1]
			        == CONVERGE_VALUE);

	std::cout << "\n\nTesting condition... \n";

	// Testbench returns a success
	if (equal_condition) {
		std::cout << "Final pedestal estimate after packet "
			  << NUM_PACKETS << " equals the verified "
			  << "convergent value: " << CONVERGE_VALUE
			  << "\n";
		return 0;
	}

	// Else, see if the value at least converges towards the
	// correct value
	else {
		std::cout << "\nVerified convergence value: "
			  << CONVERGE_VALUE << "\n";
		
		// Low pedestal
		if (PED_VAL < CONVERGE_VALUE) {
			// It does converge
			if ((ped_array[NUM_PACKETS - 1]
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
			if ((ped_array[NUM_PACKETS - 1]
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
