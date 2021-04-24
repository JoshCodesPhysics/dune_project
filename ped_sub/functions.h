#include <iostream>
#include <string>
#include "ap_int.h"
#ifndef FUNCTIONS_
#define FUNCTIONS_

// Defining array-size constants
#define N_CH 64
#define PK_S 64
#define PK_W 2
#define N_SA N_CH*PK_S*PK_W
#define PED_INIT 500
#define WIPE_DELAY 3
#define LR 1097

struct ap_axis_ps {
    ap_int<16>    data;
    ap_uint<2>    keep;
    bool    user;
    bool    last;
    bool    ready;
    bool    valid;
};

// Readable word datatype for signed 16 bit integer.
typedef short word_t;

// Declaring functions.

void output_assignment(word_t tdata_i, word_t* tdata_assign, word_t accum_i,
                word_t* accum_assign, word_t ped_i,
                word_t* ped_assign, bool tvalid_i, bool* tvalid_assign,
                bool tuser_i, bool* tuser_assign,
                bool tkeep0_i, bool* tkeep0_assign, bool tkeep1_i,
                bool* tkeep1_assign, bool treset_i,
                bool* treset_assign, bool tlast_i, bool* tlast_assign);

void previous_assign(word_t* tdata_previous, bool* tvalid_previous,
                     bool* tuser_previous,
                     bool* tkeep_previous, bool* tlast_previous,
                     word_t tdata_i, bool tvalid_i,
                     bool tuser_i,
                     bool tkeep_i, bool tlast_i);

void pedsub_HLS(word_t tdata_i, word_t* tdata_o, word_t accum_i,
                word_t* accum_o, word_t ped_i,
                word_t* ped_o, bool tvalid_i, bool* tvalid_o,
                bool tuser_i, bool* tuser_o,
                bool tkeep0_i, bool* tkeep0_o, bool tkeep1_i,
                bool* tkeep1_o, bool tready_i, bool treset_i,
                bool* treset_o, bool tlast_i, bool* tlast_o);

void set_rnd_seed(int new_seed, int& rnd_seed);

void rand_int(int& rnd_seed);

void random_signal(bool& signal, int max, int min, int limit,
		   int& random_seed);

void ped_accum_reset(word_t* ped_array, word_t* accum_array, word_t ped_val,
                     int packet_size, word_t& channel);

void full_reset(word_t* ped_array, word_t* accum_array, word_t* ADC_array,
                word_t ped_val, int packet_size, int total_samples,
                word_t& channel);

void ped_top(word_t* channel, word_t tdata_i,
             bool tvalid_i, bool tuser_i, bool tlast_i, bool tkeep_i,
             word_t ped_array[N_CH], word_t* ADC_adjusted,
             word_t accum_array[N_CH], bool tready_i, bool treset_i,
             bool* tvalid_o, bool* tuser_o, bool* tkeep_o, bool* tlast_o,
             bool* treset_o);

void pedsub_HLS_temp_tb(const std::string& input_file, word_t ADC_stored[N_SA],
		       bool tvalid_stored[N_SA],
		       bool tlast_user_stored[N_SA], bool tkeep_stored[N_SA]);

void data_read(const std::string& input_file, int& count,
               word_t* ADC_stored, bool* tvalid_stored,
               bool* tuser_stored, bool* tlast_stored, bool* tkeep_stored);

void pedsub_HLS_SSR(ap_axis_ps tdata_i, ap_axis_ps* tdata_o);

void array_scan_SSR(word_t ADC_stored[N_SA], bool tvalid_stored[N_SA],
					bool tuser_stored[N_SA], bool tlast_stored[N_SA],
					bool tkeep_stored[N_SA], word_t ADC_array[N_SA],
					int input_seed, int treset_limit, int tready_low_limit,
					int tready_high_limit);

void array_scan(int array_size, word_t ped_val,
                word_t ADC_stored[N_SA], bool tvalid_stored[N_SA],
                bool tuser_stored[N_SA], bool tlast_stored[N_SA],
		bool tkeep_stored[N_SA],
                word_t ped_array[N_CH], word_t ADC_array[N_SA],
                char accum_array[N_CH], int packet_size, int num_channels,
		int input_seed, int treset_limit, int tready_low_limit,
		int tready_high_limit);

void ped_sub_read(const std::string& input_file, word_t ped_val,
                  word_t ADC_stored[N_SA], bool tvalid_stored[N_SA],
                  bool tuser_stored[N_SA], bool tlast_stored[N_SA],
		  bool tkeep_stored[N_SA],
                  word_t ped_array[N_CH], word_t ADC_array[N_SA],
                  word_t accum_array[N_CH], int packet_size, int num_channels,
		  int input_seed, int treset_limit, int tready_low_limit,
		  int tready_high_limit, bool SSR_bool);

bool ADC_compare(const std::string& output_file, word_t* ADC_adjusted,
                 word_t* ADC_validated);

bool ped_test(word_t* ped_array, int num_packets, word_t converge_value,
              word_t ped_val);

#endif
