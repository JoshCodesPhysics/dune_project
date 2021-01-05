#include <iostream>
#include <string>

// Defining array-size constants
#define N_CH 64
#define PK_S 64
#define PK_W 100
#define N_SA N_CH*PK_S*PK_W

// Readable word datatype for signed 16 bit integer.
typedef short word_t;

// Bit field for storing 12 bit integer from word input
struct ADC_t
{
	unsigned bf: 12;
};

// Declaring functions.
void ped_alg(word_t* ped_val, char* accum, word_t* ADC,
	     word_t* tdata, bool* tvalid, bool* tkeep0,
	     bool* tkeep1, bool* tready, bool* treset,
	     bool* tlast);

void ped_sub(word_t& ped_val, int& packet_size, word_t* packet,
             bool& tvalid, bool& tkeep0, bool& tkeep1,
	     bool& tready, bool& tlast, bool& tuser);

void set_rnd_seed(int new_seed, int& rnd_seed);

void rand_int(int& rnd_seed);

void random_signal(bool& signal, int max, int min, int limit,
		   int& random_seed);

void ped_accum_reset(word_t* ped_array, char* accum_array, word_t ped_val,
                     int packet_size, word_t& channel);

void full_reset(word_t* ped_array, char* accum_array, word_t* ADC_array,
                word_t ped_val, int packet_size, int total_samples,
                word_t& channel);

void ped_top(word_t* channel, word_t* tdata, bool* first_sample,
             bool* tvalid, bool* tlast_user, bool* tkeep,
             word_t ped_array[N_CH], word_t* ADC_adjusted,
             char accum_array[N_CH], bool* treset, bool* tready,
			 bool* tvalid_out, bool* tkeep_out, bool* tlast_user_out,
			 bool* tready_out, bool* treset_out);

void array_scan(int array_size, word_t ped_val,
                word_t ADC_stored[N_SA], bool tvalid_stored[N_SA],
                bool tlast_user_stored[N_SA], bool tkeep_stored[N_SA],
                word_t ped_array[N_CH], word_t ADC_array[N_SA],
                char accum_array[N_CH], int packet_size, int num_channels,
		int input_seed, int treset_limit, int tready_limit);

void ped_sub_read(const std::string& input_file, word_t ped_val,
                  word_t ADC_stored[N_SA], bool tvalid_stored[N_SA],
                  bool tlast_user_stored[N_SA], bool tkeep_stored[N_SA],
                  word_t ped_array[N_CH], word_t ADC_array[N_SA],
                  char accum_array[N_CH], int packet_size, int num_channels,
		  int input_seed, int treset_limit, int tready_limit);

bool ADC_compare(const std::string& output_file, word_t* ADC_adjusted,
                 word_t* ADC_validated);

bool ped_test(word_t* ped_array, int num_packets, word_t converge_value,
              word_t ped_val);
