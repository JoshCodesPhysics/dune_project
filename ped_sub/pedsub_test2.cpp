#include <iostream>
#include "functions.h"

// This testbench employs the ped_sub_read function to process an input
// text file and see if the ped_alg function generates the expected
// final pedestal value from the ADC values and signal booleans
// written in the input file.

int main() {

	// Pedestal convergence test or ADC comparison test boolean:
	// false for pedestal convergence and true for ADC
	// comparison
	bool test_bool = true;

	// String containing path to project directory (edit path_proj)
	// as well as default input/output file paths
	// WILL NEED TO EDIT YOUR PROJECT PATH FOR THIS TO WORK

	// Unfortunately relative path not possible due to Vivado
	// Csim issues.

	const std::string proj_path = "/home/joshhorswill10/Documents";

	const std::string input_path = "/dune_project/ped_sub/"
				       "packet_data_in.txt";
	const std::string output_path = "/dune_project/ped_sub/"
					"packet_data_out.txt";

	const std::string input_file = proj_path + input_path;
	const std::string output_file = proj_path + output_path;
	
	// Number of packets within the input file and the number of
	// samples contained in each packet.
        const int NUM_PACKETS = 64;
        const int PACKET_SIZE = 64;
	const int NUM_SAMPLES = NUM_PACKETS*PACKET_SIZE;

	// Verified correct pedestal value after enough packets
	// have entered the channel
	const word_t CONVERGE_VALUE = 501;

	// Seed used to generate randomly high or low treset values
	const int INPUT_SEED = 45000;

	// Pedestal estimate; can affect testbench outcome
        const word_t PED_VAL = 500;

	// Empty arrays to contain the results.
        word_t ped_array[NUM_PACKETS];
        char accum_array[NUM_PACKETS];
	word_t ADC_stored[NUM_SAMPLES];
	bool tvalid_stored[NUM_SAMPLES];
	bool tlast_user_stored[NUM_SAMPLES];
	bool tkeep_stored[NUM_SAMPLES];
        word_t ADC_array[NUM_SAMPLES];
	word_t ADC_valid[NUM_SAMPLES];

	// Empty ADC and signal variables to be assigned during
	// algorithm
        word_t ADC;
        bool tready, treset;

	std::cout << "Running algorithm on input file: \n\n";

	// Calling testbench function, which in turn calls ped_alg
        ped_sub_read(input_file, PED_VAL, ADC_stored, 
		     tvalid_stored, tlast_user_stored, tkeep_stored,
		     ped_array, ADC_array, accum_array, tready, treset,
		     INPUT_SEED);
	
	// std::cout << "\n\nFinal pedestal and accumulator results: "
	// 	  << "\n\n";
        
	// Printing the final pedestal and accumulator values
	// for each packet
	// for (int i = 0; i < NUM_PACKETS; i++) {
	// 	std::cout << "Pedestal for packet " << i <<
        //                      ": " << ped_array[i] << "\n";
        //         printf("Accumulator for the same packet: %d\n",
        //                accum_array[i]);
        // }

	std::cout << "\n\n";

	if (test_bool) {
		return ADC_compare(output_file, ADC_array, ADC_valid);
	}

	else {
		return ped_test(ped_array, NUM_PACKETS, CONVERGE_VALUE,
				PED_VAL);
	}
}
