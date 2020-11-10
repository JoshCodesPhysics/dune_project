#include <iostream>

// Readable word datatype for signed 16 bit integer.
typedef short word_t;

// Bit field for storing 12 bit integer from word input
struct ADC_t
{
	unsigned bf: 12;
};

// Declaring functions.
void ped_alg(word_t& ped_val, char& accum, word_t& ADC,
	     word_t tdata, bool tvalid, bool tkeep0,
	     bool tkeep1, bool tready);

void ped_sub(word_t ped_val, int packet_size, word_t* packet,
             bool& tvalid, bool& tkeep0, bool& tkeep1,
	     bool& tready, bool& tlast, bool& tuser);

void set_rnd_seed(int new_seed, int& rnd_seed);

void rand_int(int& rnd_seed);

void read_values(std::fstream& file, word_t& ADC,
                 bool& tvalid, bool& tkeep0, bool& tkeep1,
                 bool& tlast, bool& tuser);

void ped_sub_read(std::string input_file, word_t ped_val,
                  int num_packets, word_t* ped_array, word_t* ADC_array,
                  char* accum_array, int packet_size, bool& tvalid,
                  bool& tkeep0, bool& tkeep1, bool& tready, bool& tlast,
                  bool& tuser);
