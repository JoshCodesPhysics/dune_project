#include <iostream>
#include "functions.h"
#include <fstream>
#include <string>
#include <sstream>
#include <vector>

void ped_alg(word_t& ped_val, char& accum, word_t& ADC,
             word_t tdata, bool tvalid, bool tkeep0,
	     bool tkeep1, bool tready) {
	// This function takes an input ped_val, the estimate or previous
	// pedestal (median) value, and can adjust this value according
	// to whether the input ADC value is larger or smaller for a given
	// number of iterations.
	//
	// The input booleans are signal ports for the running conditions of
	// the algorithm. These will be simulated and input by ped_sub().
	//
	// The accumulator value (accum) begins at 0, but
	// if 'ADC[i] >(<) ped_est' -> 'accum +(-) 1'. Then if accum reaches
	// +(-) 10, the new pedestal value (ped) +(-) 1 and the accum value is
	// reset to zero. This will be performed by a top function outside of
	// ped_alg, whose only purpose is to output new pedestal, accumulator
	// and ADC values.

	// Run if no back pressure from tready, and the tvalid and tkeep
	// signals are high.
	if (!tready && tvalid && tkeep0 && tkeep1) {

		//Extracting 12 bit ADC value from 16 bit word
		int mask = 4095;

		word_t trunc = mask & tdata;

		ADC = trunc;

		// Running logic to change accumulator and/or pedestal
		accumulator_condition : {
			if (ADC > ped_val) {
				accum++;
			}

			else if (ADC < ped_val) {
				accum--;
			}
		}

		pedestal_condition : {
			if (accum >= 10) {
				ped_val++;
				accum = 0;
			}

			else if (accum <= -10) {
				ped_val--;
				accum = 0;
			}
		}

		// Subtract the pedestal from the original value and assign it
		// to the placeholder variable

		ped_subtraction: {
				ADC = ADC - ped_val;
		}
	}
}

void print_signals(bool tvalid, bool tkeep0, bool tkeep1,
		   bool tready, bool tlast, bool tuser) {

	std::cout << "tvalid | tkeep0 | tkeep1 | tuser | tlast | tready"
	          << " : \n" << tvalid << " | " << tkeep0 << " | "
		  << tkeep1 << " | " << tuser << " | " << tlast
		  << " | " << tready << "\n";
}

void ped_sub(word_t ped_val, int packet_size, word_t* packet,
             bool& tvalid, bool& tkeep0, bool& tkeep1, bool& tready,
             bool& tlast, bool& tuser) {
	// N new ADC samples are stored in array index range
	// 0 -> N - 1, the accumulator is then stored at index N,
	// then final pedestal value stored at the
	// end of the array at index N+1, so uniform datatype
	// can be output into . New array hence contains
	// N + 2 entries. Remember to truncate array if you want
	// either ADC_new, accum or ped_new.
	
	// Defining the loop variables
	char accum = 0;
	word_t ped_new = ped_val;
	word_t ADC_temp;
	int i = 0;

	// Simulating the signal booleans

	std::cout << "\nBefore assigning values: \n";

	print_signals(tvalid, tkeep0, tkeep1, tready, tlast, tuser);

	tuser = false;
	tlast = false;
	tready = false;

	tvalid = tkeep0 = tkeep1 = true;

	// Signals before scanning has begun:

	std::cout << "\nBefore scanning: \n";

	print_signals(tvalid, tkeep0, tkeep1, tready, tlast, tuser);

	// While we have not reached the end of the frame or packet,
	// scan the ADC values and adjust them accordingly
	// (as well as the pedestal and accumulator).
	ADC_scan: while (!tlast && !tuser) {

		if (i == 0) {
			tvalid = true;
			tkeep0 = tvalid;
			tkeep1 = tkeep0;
		}

		std::cout << "\nSignals at start of loop " << i << ":\n";

		print_signals(tvalid, tkeep0, tkeep1, tready, tlast, tuser);

		word_t temp_word = packet[i];

		ped_alg(ped_new, accum, ADC_temp, temp_word,
			tvalid, tkeep0, tkeep1, tready);

		packet[i] = ADC_temp;

		// End of frame or packet, cancel next loop.
		if (i == packet_size - 1) {
			tuser = tlast = true;
		}

		i++;
		ADC_temp = 0;

		std::cout << "\nSignals at end of loop " << i << ":\n";

		print_signals(tvalid, tkeep0, tkeep1, tready, tlast, tuser);

		std::cout << "\n";
	}

	tuser = tlast = false;

	// Writing final accumulator and pedestal values to the end of the
	// array.

	packet[packet_size] = accum;
	packet[packet_size + 1] = ped_new;

	std::cout << "\nSignals at the end of the testbench: \n";

	print_signals(tvalid, tkeep0, tkeep1, tready, tlast, tuser);

	std::cout << "\n";
}


// Following random number generator is from christianpinder.com blog
// referencing a Park and Miller paper on the topic.

void set_rnd_seed(int new_seed, int& rnd_seed) {
    // Set new random integer seed
    rnd_seed = new_seed;
}

void rand_int(int& rnd_seed) {
    // Setting rnd_seed to random integer, see pedsub_test.cpp
    // for how to contain this in a given range
    int k1;
    int ix = rnd_seed;

    k1 = ix / 127773;
    ix = 16807 * (ix - k1 * 127773) - k1 * 2836;
    if (ix < 0)
        ix += 2147483647;
    rnd_seed = ix;
}

void ped_sub_read(const std::string& input_file, word_t ped_val, word_t* ped_array,
		  word_t* ADC_array, char* accum_array, bool& tvalid,
		  bool& tkeep0, bool& tkeep1, bool& tready, bool& tlast,
		  bool& tuser) {
	
	// This function runs ped_alg according to the ADC and boolean
	// signals acquired from an input text file of the line format
	// (where | represents the space delimiter): ADC (in hexadecimal) |
	// tvalid |  tlast | tuser | tkeep. This does not include the header.
	
	// ped_val is the pedestal estimate initially fed into the algorithm.
	// ped_array is an empty array to store the pedestal values for a
	// certain packet.
	// ADC_array is an empty array to store the adjusted ADC values for
	// all packets.
	
	// Temporary ADC and pedestal variables to later append
	// to the arrays
	word_t ADC, ped_new;

	// Make sure tready is always low to prevent backpressure
	tready = false;

	// Counters for the 'for' loop
	int count = 0;
	int packet = 0;

	// Starting values for pedestal and accumulator (ped_val is
	// the estimate).
	ped_new = ped_val;
	char accum = 0;

	// Opening data file
        std::ifstream data_file(input_file.c_str());

	// Commented print scaffolding
        // std::cout << "ADC | tvalid | tlast | tuser | tkeep\n";
	
	// Run the code if the file opens successfully
	// (no c++ built in errors for file opening issues)
	if (data_file.is_open()) {

		// Buffer to read file line
		std::string buffer;
		
		// Loops through all lines, writing each line to the buffer
		// so the data can be processed
		while (getline(data_file, buffer)) {
			
			// Buffer read print scaffolding
			// std::cout << buffer << "\n";

			// String to hold the ADC hex string
			std::string ADC_s;

			// Split buffer
			std::stringstream ss(buffer);

			// Reading data into our variables
			ss >> ADC_s >> tvalid >> tlast >> tuser >> tkeep0;

			tkeep1 = tkeep0;

			// Converting the hex into short decimal
			std::stringstream ss_hex;
			ss_hex << std::hex << ADC_s;
			ss_hex >> ADC;

			std::cout << "ADC read from line " << count
				  << ": " << ADC << "\n";
			
			// ADC value entered twice, ADC is assigned to itself
			// truncated to 12 bits (subject to change).
			// ped_alg is called every loop, all input variables
			// are adjusted
			ped_alg(ped_new, accum, ADC, ADC,
				tvalid, tkeep0, tkeep1, tready);

			// Append adjusted ADC value to storage array
			ADC_array[count] = ADC;

			std::cout << "ADC after algorithm from the same line: "
				  << ADC << "\n";

			// These signals indicate end of packet, append
			// pedestal value for this packet and continue
			// to the next one.
			if (tlast && tuser) {
				ped_array[packet] = ped_new;
				accum_array[packet] = accum;
				packet++;
			}

			// Add to the count for each loop to keep track of
			// the line being processed
			count++;
		}

		data_file.close();
	}

	// File failed to close
	else {
		std::cout << "File did not open! Simulation failed.\n";
	}
}
