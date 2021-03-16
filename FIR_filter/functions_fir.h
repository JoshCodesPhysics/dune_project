#include <iostream>
#include <string>
#include "../ped_sub/functions.h"

#define N_TAP 32

void fir_HLS(short tdata_i, short* tdata_o, bool tvalid_i,  
             bool* tvalid_o, bool tuser_i, bool* tuser_o,
             bool tkeep0_i, bool* tkeep0_o, bool tkeep1_i,
             bool* tkeep1_o, bool tready_i, bool treset_i,
             bool* treset_o, bool tlast_i, bool* tlast_o);

void array_scan_fir(short tdata_stored[N_SA],
                    bool tvalid_stored[N_SA], bool tuser_stored[N_SA],
                    bool tlast_stored[N_SA], bool tkeep_stored[N_SA],
                    short tdata_output[N_SA], int input_seed, int treset_limit,
                    int tready_low_limit, int tready_high_limit);

bool fir_testbench(const std::string& input_file,
                   const std::string& output_file, short tdata_stored[N_SA],
                   bool tvalid_stored[N_SA], bool tuser_stored[N_SA],
                   bool tlast_stored[N_SA], bool tkeep_stored[N_SA],
                   short tdata_output[N_SA], int input_seed, int treset_limit,
                   int tready_low_limit, int tready_high_limit);

