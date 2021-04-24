#include <iostream>
#include <string>
#include <stdio.h>
#include "ap_int.h"
#include "ap_axi_sdata.h"
#include "../ped_sub/functions.h"
#ifndef FUNCTIONS_FIR_
#define FUNCTIONS_FIR_

#define N_TAP 32
#define CLK_REC 1
#define L_CHK 4224

#define ADC_t ap_int<12>

struct ap_axi4s{
	    ap_int<16>    data;
	    ap_uint<2>    keep;
	    bool    user;
	    bool    last;
};

struct ap_axi4s_fir{
    ap_int<16>    data;
    ap_uint<2>    keep;
    bool    last;
};

struct ap_fir_hls_in{
	short tdata;
	short tdata_SSR;
	bool tvalid_SSR;
	ap_uint<2> tkeep;
	bool tlast;
	bool tuser;
	bool tvalid;
};

struct ap_fir_hls_out{
	short tdata;
	ap_uint<2> tkeep;
	bool tlast;
	bool tuser;
	bool tvalid;
	bool tready;
};

void fir_HLS_proto(short tdata_i, short* tdata_o,
		    bool tvalid_i, bool* tvalid_o, bool tuser_i,
	    bool* tuser_o, bool tkeep0_i, bool* tkeep0_o,
	    bool tkeep1_i, bool* tkeep1_o, bool tready_i,
	    bool treset_i, bool* treset_o, bool tlast_i,
	    bool* tlast_o);

void fir_HLS_simplified(short tdata_i, short* tdata_o,
             		    bool tvalid_i, bool* tvalid_o, bool tuser_i,
					    bool* tuser_o, bool tkeep0_i, bool* tkeep0_o,
					    bool tkeep1_i, bool* tkeep1_o, bool tready_i,
					    bool treset_i, bool* treset_o, bool tlast_i,
					    bool* tlast_o);

void fir_HLS_axi4s_simplified(ap_axi4s* tdata_i, ap_axi4s* tdata_o);

void fir_HLS_SSR(short tdata_i, short* tdata_o, bool tvalid_i,
             bool* tvalid_o, bool tuser_i, bool* tuser_o,
             bool tkeep0_i, bool* tkeep0_o, bool tkeep1_i,
             bool* tkeep1_o, bool tready_i, bool treset_i,
             bool* treset_o, bool tlast_i, bool* tlast_o);

void reg_shift_sum(short tap1[N_TAP], short tap2[N_TAP],
				   short fir_coeffs_simp[N_TAP], short tdata_in, short* sum);


void array_scan_fir(short tdata_stored[N_SA],
                    bool tvalid_stored[N_SA], bool tuser_stored[N_SA],
                    bool tlast_stored[N_SA], bool tkeep_stored[N_SA],
                    short tdata_output[N_SA], int input_seed, int treset_limit,
                    int tready_low_limit, int tready_high_limit,
					bool simplified);


bool fir_testbench(const std::string& input_file,
                   const std::string& output_file, short tdata_stored[N_SA],
                   bool tvalid_stored[N_SA], bool tuser_stored[N_SA],
                   bool tlast_stored[N_SA], bool tkeep_stored[N_SA],
                   short tdata_output[N_SA], int input_seed, int treset_limit,
                   int tready_low_limit, int tready_high_limit, bool simplified,
				   bool auto_pass);

#endif
