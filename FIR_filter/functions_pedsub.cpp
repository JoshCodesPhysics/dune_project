#include <iostream>
#include "../ped_sub/functions.h"
#include <fstream>
#include <string>
#include <sstream>
#include <vector>

void output_assignment(word_t tdata_i, word_t* tdata_assign, word_t accum_i,
                word_t* accum_assign, word_t ped_i,
                word_t* ped_assign, bool tvalid_i, bool* tvalid_assign,
                bool tuser_i, bool* tuser_assign,
                bool tkeep0_i, bool* tkeep0_assign, bool tkeep1_i,
                bool* tkeep1_assign, bool treset_i,
                bool* treset_assign, bool tlast_i, bool* tlast_assign) {

	// Output assignment to avoid multiple instances of code
	*tdata_assign = tdata_i - ped_i;
        *tvalid_assign = tvalid_i;
        *tuser_assign = tuser_i;
        *tkeep0_assign = tkeep0_i;
        *tkeep1_assign = tkeep1_i;
        *treset_assign = treset_i;
        *tlast_assign = tlast_i;
        *accum_assign = accum_i;
        *ped_assign = ped_i;

}

void previous_assign(word_t* tdata_previous, bool* tvalid_previous,
		     bool* tuser_previous,
		     bool* tkeep_previous, bool* tlast_previous,
		     word_t tdata_i, bool tvalid_i,
		     bool tuser_i,
		     bool tkeep_i, bool tlast_i) {
	//previous variable assignment to avoid multiple instances of code
	*tdata_previous = tdata_i;
	*tvalid_previous = tvalid_i;
	*tuser_previous = tuser_i;
	*tkeep_previous = tkeep_i;
	*tlast_previous = tlast_i;
}


void pedsub_HLS(word_t tdata_i, word_t* tdata_o, word_t accum_i,
		word_t* accum_o, word_t ped_i,
		word_t* ped_o, bool tvalid_i, bool* tvalid_o,
		bool tuser_i, bool* tuser_o,
		bool tkeep0_i, bool* tkeep0_o, bool tkeep1_i,
		bool* tkeep1_o, bool tready_i, bool treset_i,
		bool* treset_o, bool tlast_i, bool* tlast_o) {
	
	// Upgraded pedestal subtraction algorithm, employing static
	// variables and an internal restore mechanism. Saving and calling
	// the restored median and accumulator values must be performed by
	// another function or script, as the internal data in this block
	// is wiped every packet.
	
	// Declaring static storage variables
	static word_t accum_stored, ped_stored, tdata_previous;
	static bool tvalid_previous, tuser_previous, tkeep_previous, tlast_previous;
	static char restore_count;
	// This boolean exists to reset the above variables on the next
	// function call if tlast_i goes high

	// --- Make tlast_reset static in all scopes, so that the test bench can
	// pause incoming signals to simulate the inbetween packet phase
	static bool tlast_reset;
	
	// Reset static variables if treset goes high
	if (treset_i) {
		accum_stored = 0;
		ped_stored = PED_INIT;
		tlast_reset = false;
		restore_count = 0;

		// Outputs still need to be driven	
		output_assignment(tdata_i, &(*tdata_o), accum_stored,
				  &(*accum_o), ped_stored, &(*ped_o),
				  tvalid_i, &(*tvalid_o), tuser_i,
				  &(*tuser_o), tkeep0_i, &(*tkeep0_o),
				  tkeep1_i, &(*tkeep1_o), treset_i,
				  &(*treset_o), tlast_i, &(*tlast_o));

		previous_assign(&tdata_previous,
				&tvalid_previous,
				&tuser_previous,
				&tkeep_previous,
				&tlast_previous,
				tdata_i, tvalid_i,
				tuser_i, tkeep0_i,
				tlast_i);
	}

	else {
		if (tready_i) {
			// Run subtraction if these boolean signals are high
			if (tvalid_i && tkeep0_i && tkeep1_i) {
				accum_ped_condition: {
					if (tdata_i > ped_stored) {
						accum_stored++;

						if (accum_stored == 10) {
							ped_stored++;
							accum_stored = 0;
						}
					}

					else if (tdata_i < ped_stored) {
						accum_stored--;

						if (accum_stored == -10) {
							ped_stored--;
							accum_stored = 0;
						}
					}
				}
			}

			// Assign outputs once algorithm has completed
			output_assignment(tdata_i, &(*tdata_o), accum_stored,
                                  &(*accum_o), ped_stored, &(*ped_o),
                                  tvalid_i, &(*tvalid_o), tuser_i,
                                  &(*tuser_o), tkeep0_i, &(*tkeep0_o),
                                  tkeep1_i, &(*tkeep1_o), treset_i,
                                  &(*treset_o), tlast_i, &(*tlast_o));

			// Generate 'previous value' static variables in
			// case tready_i goes high on the next function call.
			previous_assign(&tdata_previous,
					&tvalid_previous,
					&tuser_previous,
					&tkeep_previous,
					&tlast_previous,
					tdata_i, tvalid_i,
					tuser_i, tkeep0_i,
					tlast_i);


			if (tlast_reset) {
				restore_count++;
				// std::cout << "tlast_reset has gone high, restore "
				// 	     "count is now: " << restore_count
				// 	  << "\n";
				if (restore_count == WIPE_DELAY) {
					// Replace static values with input restore
					// port values during the first sample of a
					// new packet.
					// std::cout << "Restore count has hit limit,"
					// 	     " restoring accum to "
					// 	  << accum_i << " and ped to "
					// 	  << ped_i << "\n";

					// restore and advance to next packet
					accum_stored = accum_i;
					ped_stored = ped_i;

					tlast_reset = false;
					restore_count = 0;
				}

			}

			// Reset static values on next function call
			if (tlast_i && tuser_i) {
				tlast_reset = true;
			}
		}

		else {
			output_assignment(tdata_previous, &(*tdata_o),
					  accum_stored, &(*accum_o),
					  ped_stored, &(*ped_o),
					  tvalid_previous, &(*tvalid_o),
					  tuser_previous, &(*tuser_o),
					  tkeep_previous, &(*tkeep0_o),
					  tkeep_previous, &(*tkeep1_o),
					  treset_i, &(*treset_o),
					  tlast_previous, &(*tlast_o));

			// std::cout << "tready low tdata out: "
			// 		  << *tdata_o << "\n";

			// std::cout << "tdata_previous | tvalid_previous | tuser_previous "
			// 		     "tkeep_previous | tlast_previous:   "
			// 		  << tdata_previous << " | " << tvalid_previous << " | "
			// 		  << tuser_previous << " | " << tkeep_previous << " | "
			//		  << tlast_previous << "\n";
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
		signal = !signal;
	}
}

void data_read(const std::string& input_file, int& count,
	       word_t* ADC_stored, bool* tvalid_stored,
	       bool* tuser_stored, bool* tlast_stored, bool* tkeep_stored) {
	// This function reads the data file and stores all values
	// within pre-initialised arrays, to be parsed during the
	// ped_alg processing, so that we can 'pause' during a
	// high tready.

	word_t ADC, ADC_temp;
	bool tvalid, tuser, tlast, tkeep;
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
			ss >> ADC_s >> tvalid >> tuser >>
			      tlast >> tkeep;

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
			tuser_stored[count] = tuser;
			tlast_stored[count] = tlast;
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


void ped_accum_reset(word_t* ped_array, word_t* accum_array, word_t ped_val,
		     int packet_size, word_t& channel) {
	// State save/restore pedestal and accumulator array members
        // begin at their default values.
        
	reset_loop: for (int j = 0; j < packet_size; j++) {
                ped_array[j] = ped_val;
                accum_array[j] = 0;
        }

	channel = 0;
}

void full_reset(word_t* ped_array, word_t* accum_array, word_t* ADC_array,
		word_t ped_val, int packet_size, int total_samples,
		word_t& channel) {

	// Reset pedestal and accumulator saved values
	ped_accum_reset(ped_array, accum_array, ped_val, packet_size,
			channel);

	// Reset all adjusted ADC values to zero
	ADC_reset_loop: for (int j = 0; j < total_samples; j++) {
		ADC_array[j] = 0;
	}
}


void ped_top(word_t* channel, word_t tdata_i,
	     bool tvalid_i, bool tuser_i, bool tlast_i, bool tkeep_i,
             word_t ped_array[N_CH], word_t* ADC_adjusted,
             word_t accum_array[N_CH], bool tready_i, bool treset_i,
	     bool* tvalid_o, bool* tuser_o, bool* tkeep_o, bool* tlast_o,
		 bool* treset_o) {
	// This function generates temporary variables for the ADC samples,
	// median and accumulator and restores the median and accumulator
	// from SS/R arrays. They are edited by pedsub_HLS and then saved again
	// to the same SS/R arrays. This is intended to be the top function,
	// as ped_alg required an internal saving mechanism for the pedestal
	// and accumulator to be effectively simulated, and so cannot be the
	// top function. Staged for future implementation.
	
	// State save/restore pedestal and accumulator array members
	// begin at their default values.
	if (treset_i) {

			// Reset pedestal and accumulator,
			// as well as channel count. Reset
			// all adjusted ADC values to zero.
			ped_accum_reset(ped_array, accum_array, PED_INIT,
							N_CH, *channel);
			*ADC_adjusted = tdata_i;

			std::cout << "Pedestal values after reset: "
				  << ped_array[32] << "\n";
	}

	// Temporary pedestal, ADC and accum variables to read and also
	// append to the SS/R arrays.
	word_t accum_o, ped_o, tdata_o;


	// Running the pedestal subtraction algorithm
	pedsub_HLS(tdata_i, &tdata_o, accum_array[*channel],
		   &accum_o, ped_array[*channel], &ped_o, tvalid_i,
		   &(*tvalid_o), tuser_i, &(*tuser_o), tkeep_i, &(*tkeep_o), tkeep_i,
		   &(*tkeep_o), tready_i, treset_i,
		   &(*treset_o), tlast_i, &(*tlast_o));

	// New top function implementation - scaffolding:
	// std::cout << "accum_o | ped_o | treset_o | tready_o"
	// 	  << " | tlast_o: " << accum_o << " | "
	// 	  << ped_o << " | " << *treset_o << " | "
	// 	  << *tready_o << " | " << *tlast_o << "\n";

	// Append adjusted ADC value
	// to storage array
	*ADC_adjusted = tdata_o;

	// Increase the index of the SS/R arrays once tlast and tuser go high
	if (tlast_i && tuser_i && tvalid_i) {

		// Array values for this channel are
		// overwritten by the output variables from
		// ped_alg, and used for the next sample for that channel.
		// They are also used for the next packet
		// that comes through this channel, i.e.
		// in 64 packets time
		
		ped_array[*channel] = ped_o;
		accum_array[*channel] = accum_o;
		
		// std::cout << "tlast has gone high, saving then restoring"
		// 	  << " the median and accumulator: "
		// 	  << ped_array[*channel] << " "
		// 	  << accum_array[*channel] << "\n";

		(*channel)++;

		// pedestal and accumulator restore is implemented
		// within the top function

		// Last channel has been processed,
		// return to pedestal and accumulator
		// values for channel 0 and process
		// the next wave of packets
		if (*channel == N_CH) {
			*channel = 0;
			// std::cout << "Final channel, now processing "
			// 		     "packet for channel 0.\n";
		}

		else {
			// std::cout << "End of channel " << *channel
			//           << ", now beginning channel: "
			//           << *channel + 1 << "\n";

		}
	}

	// These writes are just so the boolean signals have
	// output ports after synthesis
	
	*tvalid_o = tvalid_i;
	*tuser_o = tuser_i; 
	*tkeep_o = tkeep_i;
	*tlast_o = tlast_i;
	*treset_o = treset_i;
}


void array_scan(int array_size, word_t ped_val,
                word_t ADC_stored[N_SA], bool tvalid_stored[N_SA],
                bool tuser_stored[N_SA], bool tlast_stored[N_SA],
		bool tkeep_stored[N_SA],
                word_t ped_array[N_CH], word_t ADC_array[N_SA],
                word_t accum_array[N_CH], int packet_size, int num_channels,
	        int input_seed, int treset_limit, int tready_low_limit, int tready_high_limit) {
 
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
	
	// input_seed is a random integer seed for the random raising of
	// treset and tready
	// treset_limit is used in the probability of treset going high
	// i.e. 1/treset_limit
	// tready_limit is essentially parallel to the above, but for
	// tready.

	// Make sure tready is initially low to prevent backpressure
	bool tready = true;
	// Make sure treset is initially low to prevent infinite loop
	bool treset = false;

	// Counters for the while loop and data read
	word_t channel;
	int i = 0;
	bool first_sample = true;
	int attempt = 1;
	// Count to simulate delay between packets where tvalid is low
	char tlast_delay = 0;

	// Random seed integer
	int random_seed;

	// Setting the random seed
	set_rnd_seed(input_seed, random_seed);

	// Algorithm scan while loop, executes until iterator reaches index
	// of the last value in the data arrays. Iterator doesn't always
	// increase (can revert back to i = 0, or i--)
	array_scan: while (i < array_size) {

		// Random assign
		random_signal(treset, 1, treset_limit, 1, random_seed);

		// Randomly assigning tready signal if not tlast
		random_signal(tready, 1, tready_low_limit, 1,
					  random_seed);
		
		if (tlast_stored[i] || tuser_stored[i]) {
			tready = true;
		}

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
			treset = false;
		}

		// If it is not high, run scan as usual
		else {

			// Initialising an input variable to be later
			// appended to
			// the correponding output ADC array
			word_t ADC_adjusted;

			// Initialising output signal booleans for
			// the synthesis ports
			bool tvalid_i, tuser_i, tlast_i, tvalid_out,
			     tuser_out, tkeep_out, tlast_out,
			     tready_out, treset_out;

			if (i == 0) {
				treset = true;
			}

			if (tuser_stored[i] && tlast_stored[i] && (tlast_delay > 0)) {
				tuser_i = tlast_i = tvalid_i = false;
			}

			else {
				tuser_i = tuser_stored[i];
				tlast_i = tlast_stored[i];
				tvalid_i = tvalid_stored[i];
			}

			ped_top(&channel, ADC_stored[i],
				tvalid_i, tuser_i,
				tlast_i,
				tkeep_stored[i], ped_array,
				&ADC_adjusted,
				accum_array, tready, treset,
				&tvalid_out, &tuser_out, &tkeep_out,
				&tlast_out, &treset_out);
			
			if (tvalid_out) {
				ADC_array[i] = ADC_adjusted;
			}

			
			// if (i == 1097) {
			// 	std::cout
			// 	<< "Channel | "
			// 	<< "pedestal | accumulator | tready"
			//  	   " | treset | tlast | tdata for i= "
			// 	<< i << ": " << channel << " | " <<
			// 	ped_array[channel] << " | "
			// 	<< accum_array[channel]
			// 	<< " | " << tready_out << " | "
			// 	<< treset_out
			// 	<< " | " << tlast_user_out << " | "
			// 	<< ADC_stored[i]
			// 	<< "\n";
			// }

			if (i==0) {
				treset = false;
			}

			if (tuser_stored[i] && tlast_stored[i]) {
				if (tlast_delay < WIPE_DELAY) {
					// std::cout << "\ntlast delay "
					// 	     "is in effect "
					// 	     " for line "
					// 	  << i << "\n";
					// Add to the delay counter
					// and make sure that i does
					// not increase
					tlast_delay++;
					i--;
				}
				
				else {
					tlast_delay = 0;
					// std::cout << "\ntlast delay is"
					// 	     " now over "
					// 	     "on line "
					// 	  << i << "\n";
					// std::cout << "\n Final pedestal "
					// 	     "value for this "
					// 	     "channel was: "
					// 	  << ped_array[channel]
					// 	  << ".\n";
					if (channel + 1 < num_channels) {
					// 	std::cout << "Now loading "
					// 		     "pedestal and "
					// 		     "accumulator for"
					// 		     " channel "
					// 		  << channel + 1
					//		  << ".\n";
					}
				}
			}
			
				
			// If tready is high, revert to previous loop
			// and check if tready is still high, recursive
			// until tready is low, then scan as usual.
			if (!tready) {
				// Iterator does not increase, we process
				// the same loop again
				
				// Print scaffolding for this scenario
				std::cout << "\nLine " << i << 
					     " had a low tready "
					     "during attempt " << attempt
					     << " so pointer will return to "
					     "that line and reattempt the "
					     "scan \n";
				random_signal(tready, 1, tready_high_limit, 1,
							      random_seed);
			}

			// If tready is high, move on to the next sample.
			else {

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
                  bool tuser_stored[N_SA],bool tlast_stored[N_SA],
		  bool tkeep_stored[N_SA],
                  word_t ped_array[N_CH], word_t ADC_array[N_SA],
                  word_t accum_array[N_CH], int packet_size, int num_channels,
	          int input_seed, int treset_limit, int tready_low_limit,
			  int tready_high_limit) {
	// This is the master (testbench) function to combine the
	// read and scan protocols to simulate the flow of samples
	// through the pedestal subtraction algorithm.

	// Count number of lines in file so we know the size of the
	// required storage array.
	int count;

	// Reading data to empty arrays
	data_read(input_file, count, ADC_stored, tvalid_stored,
		  tuser_stored, tlast_stored, tkeep_stored);

	// Finding size of storage arrays
	int array_size = count;

	// Scanning the data stored from the read function and appending
	// the output values from the ped_alg function to preallocated
	// arrays.
	array_scan(array_size, ped_val, ADC_stored, tvalid_stored,
                   tuser_stored, tlast_stored, tkeep_stored, ped_array,
                   ADC_array, accum_array, packet_size, num_channels,
		   input_seed, treset_limit, tready_low_limit, tready_high_limit);
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
