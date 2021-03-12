#include <iostream>
#include <string>

#define N_TAP 32

void fir_HLS(short tdata_i, short* tdata_o, bool tvalid_i,  
             bool* tvalid_o, bool tuser_i, bool* tuser_o,
             bool tkeep0_i, bool* tkeep0_o, bool tkeep1_i,
             bool* tkeep1_o, bool tready_i, bool treset_i,
             bool* treset_o, bool tlast_i, bool* tlast_o);


