#include <iostream>
#include "functions_fir.h"
#include "../ped_sub/functions.h"

// This testbench employs the fir_HLS top function in order to test it's
// output against a model software output.

int main() {
        
	const std::string proj_path = "/data/hmo31799";
	const std::string input_path = "/dune_project/FIR_filter/IO_files/"
				       "FixedHits_D_pedsub_up_headrm_axi4s.0.txt";
	const std::string output_path = "/dune_project/FIR_filter/IO_files/"
					"FixedHits_D_fir0_up_headrm_axi4s.0.txt";

	const std::string input_file = proj_path + input_path;
	const std::string output_file = proj_path + output_path;	
	
	short tdata_stored[N_SA], tdata_output[N_SA];
	bool tvalid_stored[N_SA], tuser_stored[N_SA], tlast_stored[N_SA],
	     tkeep_stored[N_SA];

	int input_seed = 45000;
	const int TRESET_LIMIT = 5000;
	const int TREADY_LOW_LIMIT = 400;
	const int TREADY_HIGH_LIMIT = 6;

	return fir_testbench(input_file, output_file, tdata_stored,
			     tvalid_stored, tuser_stored, tlast_stored,
			     tkeep_stored, tdata_output, input_seed,
			     TRESET_LIMIT, TREADY_LOW_LIMIT,
			     TREADY_HIGH_LIMIT);
}

