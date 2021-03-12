#include <iostream>
#include "functions_fir.h"
#include "../ped_sub/functions.h"

// This testbench employs the fir_HLS top function in order to test it's
// output against a model software output.

int main() {
	// Just temporary input variables to test syntax errors
	short tdata_i = 5;
	bool tvalid_i = true;
	bool tuser_i = false;
	bool tkeep0_i = true;
	bool tkeep1_i = true;
	bool tready_i = true;
	bool tlast_i = true;

	short tdata_o;
	bool tvalid_o, tuser_o, tkeep0_o, tkeep1_o,
	     treset_o, tlast_o;

	bool treset_i = true;

	fir_HLS(tdata_i, &tdata_o, tvalid_i, &tvalid_o, tuser_i,
		&tuser_o, tkeep0_i, &tkeep0_o, tkeep1_i, &tkeep1_o,
		tready_i, treset_i, &treset_o, tlast_i, &tlast_o);
	
	return 0;

}

