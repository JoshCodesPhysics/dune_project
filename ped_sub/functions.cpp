#include <iostream>
#include "functions.h"
#include <fstream>
#include <string>
#include <sstream>
#include <vector>


void ped_alg(word_t& ped_val, char& accum, word_t& ADC,
             word_t tdata, bool tvalid, bool tkeep0,
	     bool tkeep1, bool tready, bool treset) {
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
	if (!tready && tvalid && tkeep0 && tkeep1 && !treset) {

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
		   bool tready, bool tlast, bool tuser, bool treset) {

	std::cout << "tvalid | tkeep0 | tkeep1 | tuser | tlast | tready"
	          << " | treset"
		  << " : \n" << tvalid << " | " << tkeep0 << " | "
		  << tkeep1 << " | " << tuser << " | " << tlast
		  << " | " << tready << " | " << treset << "\n";
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
	bool treset = false;

	// Simulating the signal booleans

	std::cout << "\nBefore assigning values: \n";

	print_signals(tvalid, tkeep0, tkeep1, tready, tlast, tuser, treset);

	tuser = false;
	tlast = false;
	tready = false;

	tvalid = tkeep0 = tkeep1 = true;

	// Signals before scanning has begun:

	std::cout << "\nBefore scanning: \n";

	print_signals(tvalid, tkeep0, tkeep1, tready, tlast, tuser, treset);

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

		print_signals(tvalid, tkeep0, tkeep1, tready, tlast, tuser,
			      treset);

		word_t temp_word = packet[i];

		ped_alg(ped_new, accum, ADC_temp, temp_word,
			tvalid, tkeep0, tkeep1, tready, treset);

		packet[i] = ADC_temp;

		// End of frame or packet, cancel next loop.
		if (i == packet_size - 1) {
			tuser = tlast = true;
		}

		i++;
		ADC_temp = 0;

		std::cout << "\nSignals at end of loop " << i << ":\n";

		print_signals(tvalid, tkeep0, tkeep1, tready, tlast, tuser,
			      treset);

		std::cout << "\n";
	}

	tuser = tlast = false;

	// Writing final accumulator and pedestal values to the end of the
	// array.

	packet[packet_size] = accum;
	packet[packet_size + 1] = ped_new;

	std::cout << "\nSignals at the end of the testbench: \n";

	print_signals(tvalid, tkeep0, tkeep1, tready, tlast, tuser, treset);

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


void random_signal(bool& signal, int min, int max, int limit,
		   int& rand_seed) {
	// Function for generating a randomly high or low signal value.
	// max and min determine the range of random values that are
	// generated, and limit is the value that this random value
	// must be less than or equal to in order to go high, e.g.
	// min = 1, max = 200, limit = 2, statistically the
	// signal will go high for 1% of samples.

	int rand_value;
	
	// Generating a random integer
	rand_int(rand_seed);

	// generating the random value within the given range 
	rand_value = min + (rand_seed % (max - min + 1));

	// random value print scaffolding
	// std::cout << "rand_value: " << rand_value << "\n";

	// If the random value is below the threshold, set the signal
	// to high
	

	if (rand_value <= limit) {
		signal = true;
	}

	else {
		signal = false;
	}
}

void data_read(const std::string& input_file, int& count,
	       word_t* ADC_stored, bool* tvalid_stored,
	       bool* tlast_user_stored, bool* tkeep_stored) {
	// This function reads the data file and stores all values
	// within pre-initialised arrays, to be parsed during the
	// ped_alg processing, so that we can 'pause' during a
	// high tready.

	word_t ADC, ADC_temp;
	bool tvalid, tlast_user, tkeep;
	count = 0;

	// Opening data file
        std::ifstream data_file(input_file.c_str());
	
	if (data_file.is_open()) {

		// Buffer to read file line
		std::string buffer;

		// Loops through all lines, writing each line to the buffer
		// so the data can be processed
		data_read: while (getline(data_file, buffer)) {
				
			// Reading the data:

			// String to hold the ADC hex string
			std::string ADC_s;

			// Split buffer
			std::stringstream ss(buffer);

			// Reading data into our variables
			ss >> ADC_s >> tvalid >> tlast_user >>
			      tlast_user >> tkeep;

			// Converting the hex into short decimal
			std::stringstream ss_hex;
			ss_hex << std::hex << ADC_s;
			ss_hex >> ADC_temp;

			// Two's complement conversion for signed
			// 16 bit values
			ADC = (0x8000&ADC_temp ?
                              (int)(0x7FFF&ADC_temp)-0x8000 : ADC_temp);

			// Storing values in the input arrays
			ADC_stored[count] = ADC;
			tvalid_stored[count] = tvalid;
			tlast_user_stored[count] = tlast_user;
			tkeep_stored[count] = tkeep;

			// std::cout << "\nReading scaffolding:\n";

			// std::cout << "Count " << count <<
			// 	     " ADC | tvalid | tlast_user | tkeep"
			// 	     ": " << ADC_stored[count] << " | "
			// 	     << tvalid_stored[count] << " | "
			// 	     << tlast_user_stored[count] << " | "
			// 	     << tkeep_stored[count] << "\n";
			
			count++;
		}
	}

	else {
		std::cout << "File failed to open, adjust file path.\n";
	}
}


void ped_accum_reset(word_t* ped_array, char* accum_array, word_t ped_val,
		     int packet_size, int& channel) {
	// State save/restore pedestal and accumulator array members
        // begin at their default values.
        
	reset_loop: for (int j = 0; j < packet_size; j++) {
                ped_array[j] = ped_val;
                accum_array[j] = 0;
        }

	channel = 0;
}

void full_reset(word_t* ped_array, char* accum_array, word_t* ADC_array,
		word_t ped_val, int packet_size, int total_samples,
		int& channel) {

	// Reset pedestal and accumulator saved values
	ped_accum_reset(ped_array, accum_array, ped_val, packet_size,
			channel);

	// Reset all adjusted ADC values to zero
	ADC_reset_loop: for (int j = 0; j < total_samples; j++) {
		ADC_array[j] = 0;
	}
}


void array_scan(int array_size, word_t ped_val,
                word_t ADC_stored[N_SA], bool tvalid_stored[N_SA],
                bool tlast_user_stored[N_SA], bool tkeep_stored[N_SA],
                word_t ped_array[N_CH], word_t ADC_array[N_SA],
                char accum_array[N_CH], int input_seed,
                int packet_size, int num_channels) {
 
	// This function runs ped_alg according to the ADC and boolean
	// signals acquired from an input text file of the line format
	// (where | represents the space delimiter): ADC (in hexadecimal) |
	// tvalid |  tlast | tuser | tkeep. This does not include the header.
	
	// Contingency include for random tready signals going high, so that
	// the while loop repeats an iteration until it goes low again.
	// Similar contingency for random treset going high (less likely) so
	// that the entire process is wiped clean and repeated.

	// ped_val is the pedestal estimate initially fed into the algorithm.
	// ADC_stored is an empty array to store the read ADC values from the
	// data file, similarly to tvalid_stored, tlast_user_stored and
	// tkeep_stored
	// ped_array is an empty array to store the pedestal values for a
	// certain channel.
	// ADC_array is an empty array to store the adjusted ADC values for
	// all packets (using state save/restore arrays)
	// accum_array is an empty array to store the changing accumulator
	// values at the end of each packet

	// Make sure tready is initially low to prevent backpressure
	bool tready = false;
	// Make sure treset is initially low to prevent infinite loop
	bool treset = false;

	// Counters for the while loop and data read
	int channel = 0;
	int i = 0;
	int attempt = 1;

	// Temporary pedestal, ADC and accum variables to read and also
	// append to the SS/R arrays.
	word_t ADC, ped_new;
	char accum;

	// State save/restore pedestal and accumulator array members
	// begin at their default values.
	ped_accum_reset(ped_array, accum_array, ped_val, packet_size,
			channel);

	// Random seed integer
	int random_seed;

	// Setting the random seed
	set_rnd_seed(input_seed, random_seed);

	// Algorithm scan while loop, executes until iterator reaches index
	// of the last value in the data arrays. Iterator doesn't always
	// increase (can revert back to i = 0, or i--)
	array_scan: while (i < array_size) {

		// Random assign
		random_signal(treset, 1, 8200, 1, random_seed);

		// Randomly assigning tready signal
		random_signal(tready, 1, 600, 1,
			      random_seed);
		
		// Reset entire loop if treset is high
		if (treset) {
			// treset print scaffolding
			std::cout << "\ntreset went high, "
				     "for iteration "
				  << i << " "
				     "so entire process "
				     "will be reset.\n"
				  << "Attempt " << attempt
			          << " has ended.\n";	  
			
			// Reset pedestal and accumulator,
			// as well as channel count. Reset
			// all adjusted ADC values to zero.
			// Send while counter (i) back to zero
			full_reset(ped_array, accum_array, ADC_array,
				   ped_val, packet_size, array_size,
				   channel);
			i = 0;
			attempt++;
		}

		// If it is not high, run scan as usual
		else {

			// If tready is high, revert to previous loop
			// and check if tready is still high, recursive
			// until tready is low, then scan as usual.
			if (tready) {
				// Iterator does not increase, we process
				// the same loop again
				
				// Print scaffolding for this scenario
				std::cout << "\nLine " << i << 
					     " had a high tready "
					     "during attempt " << attempt
					     << " so pointer will return to "
					     "that line and reattempt the "
					     "scan \n";
			}

			// If tready is not high, record the
			// scan as usual
			else {	
				// ADC stored value entered, ADC variabled
				// is assigned to that value
				// truncated to 12 bits (subject
				// to change).
				// ped_alg is called every loop.

				// State save/restore for pedestal and
				// accumulator
				ped_new = ped_array[channel];
				accum = accum_array[channel];
				
				ped_alg(ped_new, accum, ADC, ADC_stored[i],
					tvalid_stored[i], tkeep_stored[i],
					tkeep_stored[i], 
					tready, treset);

				// Array values for this channel are
				// overwritten by the output variables from
				// ped_alg, and used in the next loop.
				// They are also used for the next packet
				// that comes through this channel, i.e.
				// in 64 packets time
				ped_array[channel] = ped_new;
				accum_array[channel] = accum;
				
				// Append adjusted ADC value
				// to storage array
				ADC_array[i] = ADC;

				// These signals indicate end
				// of packet -> append
				// pedestal value for this
				// channel and continue
				// to the next one.
				if (tlast_user_stored[i]) {
					ped_array[channel] = ped_new;
					accum_array[channel] = accum;
					 
					std::cout << "\n Final pedestal "
						     "value for this "
						     "channel was: "
						  << ped_array[channel]
						  << ".\n";
					
					if (channel + 1 < num_channels) {
						std::cout << "Now loading "
							     "pedestal and "
							     "accumulator for"
							     " channel "
							  << channel + 1
							  << ".\n";
					}

					channel++;

					// Last channel has been processed,
					// return to pedestal and accumulator
					// values for channel 0 and process
					// the next wave of packets
					if (channel > (num_channels - 1)) {
						std::cout << "\nLast channel"
							     " processed, re"
							     "turning to cha"
							     "nnel 0.\n";
						channel = 0;
					}
				}

				// Add to the while loop counter every
				// loop to increase the index of the
				// array element being written
				i++;
			}
		}
	}
	std::cout << "\nEnd of scan.\n\n";
}


void ped_sub_read(const std::string& input_file, word_t ped_val,
                  word_t ADC_stored[N_SA], bool tvalid_stored[N_SA],
                  bool tlast_user_stored[N_SA], bool tkeep_stored[N_SA],
                  word_t ped_array[N_CH], word_t ADC_array[N_SA],
                  char accum_array[N_CH], int input_seed, int packet_size,
                  int num_channels) {
	// This is the master (testbench) function to combine the
	// read and scan protocols to simulate the flow of samples
	// through the pedestal subtraction algorithm.

	// Count number of lines in file so we know the size of the
	// required storage array.
	int count;

	// Reading data to empty arrays
	data_read(input_file, count, ADC_stored, tvalid_stored,
		  tlast_user_stored, tkeep_stored);

	// Finding size of storage arrays
	int array_size = count;

	// Scanning the data stored from the read function and appending
	// the output values from the ped_alg function to preallocated
	// arrays.
	array_scan(array_size, ped_val, ADC_stored, tvalid_stored,
                   tlast_user_stored, tkeep_stored, ped_array,
                   ADC_array, accum_array, input_seed, packet_size,
                   num_channels);
}


bool ADC_compare(const std::string& output_file, word_t* ADC_adjusted,
		 word_t* ADC_validated) {
	// Function that compares our output ADC values with the
	// validated output file from the VHDL implementation of
	// ped_alg
	
	// Open output file
	std::ifstream output(output_file.c_str());

	// Default false until a mismatch is found
	bool ADC_bool = 0;

	if (output.is_open()) {
		
		// While loop counters and placeholder variables
		std::string buffer;
		int count = 0;
		word_t ADC;
		int ADC_temp;

		output_read: while (getline(output, buffer)) {
			
			// Same as data_read()
			std::string ADC_s;
			
			std::stringstream ss(buffer);

			ss >> ADC_s;

			std::stringstream ss_hex;
                        ss_hex << std::hex << ADC_s;
                        ss_hex >> ADC_temp;

			ADC = (0x8000&ADC_temp ?
			      (int)(0x7FFF&ADC_temp)-0x8000 : ADC_temp);

			ADC_validated[count] = ADC;

			count++;
		}
		
		std::cout << "\nAdjusted ADC value comparison:\n\n";

		comparison_loop: for (int i = 0; i < count; i++) {

			// Printing comparison values for the testbench
			std::cout << "ADC adjusted value for line "
				  << i << ": " << ADC_adjusted[i]
				  << "\n"
				  << "ADC validated value for same line: "
				  << ADC_validated[i]
				  << "\n";

			// If the values are not equal, testbench fails
			// and loop ends, true boolean is returned.
			if (!(ADC_adjusted[i] == ADC_validated[i])) {
					
					std::cout << "ADC values do not"
						  << " match for line "
						  << i << ".\n";

					ADC_bool = 1;
					break;
			}
		}
	}

	// Testbench failure
	else {
		std::cout << "Output file did not open. Check file path.\n";
		ADC_bool = 1;
	}

	// Testbench failure
	if (ADC_bool) {
		std::cout << "Testbench did not run successfully\n";
	}

	// Testbench success
	else {
		std::cout << "Testbench ran successfully!\n";
	}

	return ADC_bool;
}


bool ped_test(word_t* ped_array, int num_packets, word_t converge_value,
              word_t ped_val) {
	// This testbench function tests the algorithm to see the pedestal
	// converges towards a known correct value. If it does this
	// successfully, function returns a 0, and vice versa, a 1.

	// Instantaneous success condition: If the final pedestal
        // value equals the verified convergent value
        bool equal_condition = (ped_array[num_packets - 1]
                                == converge_value);

        std::cout << "\n\nTesting condition... \n";

        // Testbench returns a success
        if (equal_condition) {
                std::cout << "Final pedestal estimate after packet "
                          << num_packets << " equals the verified "
                          << "convergent value: " << converge_value
                          << "\n";
                return 0;
        }

        // Else, see if the value at least converges towards the
        // correct value
        else {
                std::cout << "\nVerified convergence value: "
                          << converge_value << "\n";

                // Low pedestal
                if (ped_val < converge_value) {
                        // It does converge
                        if ((ped_array[num_packets - 1]
                             - ped_array[0]) > 0) {
                                std::cout << "Low pedestal value is "
                                          << "increasing towards "
                                          << "the verified "
                                          << "convergence value."
                                          << "\n";
                                return 0;
                        }

                        // It doesn't
                        else {
                                std::cout << "Low pedestal value is not "
                                          << "increasing towards the verified"
                                          << " convergence value.\n";
                                return 1;
                        }
                }

                // High pedestal
		                else {
                        // It does converge
                        if ((ped_array[num_packets - 1]
                             - ped_array[0]) < 0) {
                                std::cout << "High pedestal value is "
                                          << "decreasing towards "
                                          << "the verified "
                                          << "convergence value.\n";
                                return 0;
                        }

                        // It doesn't
                        else {
                                std::cout << "High pedestal value is "
                                          << "not decreasing towards "
                                          << "the verified "
                                          << "convergence value.\n";
                                return 1;
                        }
                }

        }
}
