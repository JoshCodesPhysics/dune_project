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

	const std::string proj_path = "/data/hmo31799";

	const std::string input_path = "/dune_project/ped_sub/IO_files/"
				       "6400_packets_in.txt";
	const std::string output_path = "/dune_project/ped_sub/IO_files/"
					"6400_packets_out.txt";

	const std::string input_file = proj_path + input_path;
	const std::string output_file = proj_path + output_path;
	
	// Number of packets within the input file and the number of
	// samples contained in each packet.
        const int NUM_CHANNELS = N_CH;
        const int PACKET_SIZE = PK_S;
	const int PACKET_WAVES = PK_W;
	const int NUM_SAMPLES = NUM_CHANNELS * PACKET_SIZE * PACKET_WAVES;

	// Verified correct pedestal value after enough packets
	// have entered the channel
	const word_t CONVERGE_VALUE = 501;

	// Seed used to generate randomly high or low treset values
	const int INPUT_SEED = 57000;
	// Probability of treset and tready going high is 1/<limit>
	const int TRESET_LIMIT = 500000;
	const int TREADY_LOW_LIMIT = 10000;
	const int TREADY_HIGH_LIMIT = 10;

	// Pedestal estimate; can affect testbench outcome
    	const word_t PED_VAL = 500;

	// Empty arrays to contain the results.
    	word_t ped_array[NUM_CHANNELS];
    	word_t accum_array[NUM_CHANNELS];
	word_t ADC_stored[NUM_SAMPLES];
	bool tvalid_stored[NUM_SAMPLES];
	bool tuser_stored[NUM_SAMPLES];
	bool tlast_stored[NUM_SAMPLES];
	bool tkeep_stored[NUM_SAMPLES];
    	word_t ADC_array[NUM_SAMPLES];

	word_t ADC_valid[NUM_SAMPLES];

	std::cout << "Running algorithm on input file: \n\n";

	// Calling separate simplified testbench function, calling
	// ped_simplified

	// pedsub_HLS_temp_tb(input_file, ADC_stored, tvalid_stored,
	// 				  tlast_user_stored, tkeep_stored);

	// Calling testbench function, which in turn calls ped_alg
    ped_sub_read(input_file, PED_VAL, ADC_stored,
	         tvalid_stored, tuser_stored, tlast_stored, tkeep_stored,
	         ped_array, ADC_array, accum_array, PACKET_SIZE,
		 NUM_CHANNELS, INPUT_SEED, TRESET_LIMIT,
		 TREADY_LOW_LIMIT, TREADY_HIGH_LIMIT);
	
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
		return ped_test(ped_array, NUM_CHANNELS, CONVERGE_VALUE,
	 			PED_VAL);
	}
}
