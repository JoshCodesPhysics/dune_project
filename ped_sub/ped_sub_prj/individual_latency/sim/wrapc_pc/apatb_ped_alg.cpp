// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================

#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;


// [dump_struct_tree [build_nameSpaceTree] dumpedStructList] ---------->


// [dump_enumeration [get_enumeration_list]] ---------->


// wrapc file define: "ped_val"
#define AUTOTB_TVIN_ped_val  "../tv/cdatafile/c.ped_alg.autotvin_ped_val.dat"
#define AUTOTB_TVOUT_ped_val  "../tv/cdatafile/c.ped_alg.autotvout_ped_val.dat"
// wrapc file define: "accum"
#define AUTOTB_TVIN_accum  "../tv/cdatafile/c.ped_alg.autotvin_accum.dat"
#define AUTOTB_TVOUT_accum  "../tv/cdatafile/c.ped_alg.autotvout_accum.dat"
// wrapc file define: "ADC"
#define AUTOTB_TVIN_ADC  "../tv/cdatafile/c.ped_alg.autotvin_ADC.dat"
#define AUTOTB_TVOUT_ADC  "../tv/cdatafile/c.ped_alg.autotvout_ADC.dat"

#define INTER_TCL  "../tv/cdatafile/ref.tcl"

// tvout file define: "ped_val"
#define AUTOTB_TVOUT_PC_ped_val  "../tv/rtldatafile/rtl.ped_alg.autotvout_ped_val.dat"
// tvout file define: "accum"
#define AUTOTB_TVOUT_PC_accum  "../tv/rtldatafile/rtl.ped_alg.autotvout_accum.dat"
// tvout file define: "ADC"
#define AUTOTB_TVOUT_PC_ADC  "../tv/rtldatafile/rtl.ped_alg.autotvout_ADC.dat"

class INTER_TCL_FILE {
	public:
		INTER_TCL_FILE(const char* name) {
			mName = name;
			ped_val_depth = 0;
			accum_depth = 0;
			ADC_depth = 0;
			trans_num =0;
		}

		~INTER_TCL_FILE() {
			mFile.open(mName);
			if (!mFile.good()) {
				cout << "Failed to open file ref.tcl" << endl;
				exit (1);
			}
			string total_list = get_depth_list();
			mFile << "set depth_list {\n";
			mFile << total_list;
			mFile << "}\n";
			mFile << "set trans_num "<<trans_num<<endl;
			mFile.close();
		}

		string get_depth_list () {
			stringstream total_list;
			total_list << "{ped_val " << ped_val_depth << "}\n";
			total_list << "{accum " << accum_depth << "}\n";
			total_list << "{ADC " << ADC_depth << "}\n";
			return total_list.str();
		}

		void set_num (int num , int* class_num) {
			(*class_num) = (*class_num) > num ? (*class_num) : num;
		}
	public:
		int ped_val_depth;
		int accum_depth;
		int ADC_depth;
		int trans_num;

	private:
		ofstream mFile;
		const char* mName;
};

extern void ped_alg (
int (&ped_val),
int (&accum),
int (&ADC));

void AESL_WRAP_ped_alg (
int (&ped_val),
int (&accum),
int (&ADC))
{
	refine_signal_handler();
	fstream wrapc_switch_file_token;
	wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
	int AESL_i;
	if (wrapc_switch_file_token.good())
	{
		CodeState = ENTER_WRAPC_PC;
		static unsigned AESL_transaction_pc = 0;
		string AESL_token;
		string AESL_num;
		static AESL_FILE_HANDLER aesl_fh;


		// output port post check: "ped_val"
		aesl_fh.read(AUTOTB_TVOUT_PC_ped_val, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_ped_val, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_ped_val, AESL_token); // data

			sc_bv<32> *ped_val_pc_buffer = new sc_bv<32>[1];
			int i = 0;

			while (AESL_token != "[[/transaction]]")
			{
				bool no_x = false;
				bool err = false;

				// search and replace 'X' with "0" from the 1st char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('X');
					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'ped_val', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				no_x = false;

				// search and replace 'x' with "0" from the 3rd char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('x', 2);

					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'ped_val', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				// push token into output port buffer
				if (AESL_token != "")
				{
					ped_val_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_ped_val, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_ped_val))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: ped_val
				{
					// bitslice(31, 0)
					// {
						// celement: ped_val(31, 0)
						// {
							sc_lv<32>* ped_val_lv0_0_0_1 = new sc_lv<32>[1];
						// }
					// }

					// bitslice(31, 0)
					{
						int hls_map_index = 0;
						// celement: ped_val(31, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								if (&(ped_val) != NULL) // check the null address if the c port is array or others
								{
									ped_val_lv0_0_0_1[hls_map_index].range(31, 0) = sc_bv<32>(ped_val_pc_buffer[hls_map_index].range(31, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(31, 0)
					{
						int hls_map_index = 0;
						// celement: ped_val(31, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : ped_val
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : ped_val
								// output_left_conversion : ped_val
								// output_type_conversion : (ped_val_lv0_0_0_1[hls_map_index]).to_uint64()
								if (&(ped_val) != NULL) // check the null address if the c port is array or others
								{
									ped_val = (ped_val_lv0_0_0_1[hls_map_index]).to_uint64();
									hls_map_index++;
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] ped_val_pc_buffer;
		}

		// output port post check: "accum"
		aesl_fh.read(AUTOTB_TVOUT_PC_accum, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_accum, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_accum, AESL_token); // data

			sc_bv<32> *accum_pc_buffer = new sc_bv<32>[1];
			int i = 0;

			while (AESL_token != "[[/transaction]]")
			{
				bool no_x = false;
				bool err = false;

				// search and replace 'X' with "0" from the 1st char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('X');
					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'accum', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				no_x = false;

				// search and replace 'x' with "0" from the 3rd char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('x', 2);

					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'accum', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				// push token into output port buffer
				if (AESL_token != "")
				{
					accum_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_accum, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_accum))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: accum
				{
					// bitslice(31, 0)
					// {
						// celement: accum(31, 0)
						// {
							sc_lv<32>* accum_lv0_0_0_1 = new sc_lv<32>[1];
						// }
					// }

					// bitslice(31, 0)
					{
						int hls_map_index = 0;
						// celement: accum(31, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								if (&(accum) != NULL) // check the null address if the c port is array or others
								{
									accum_lv0_0_0_1[hls_map_index].range(31, 0) = sc_bv<32>(accum_pc_buffer[hls_map_index].range(31, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(31, 0)
					{
						int hls_map_index = 0;
						// celement: accum(31, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : accum
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : accum
								// output_left_conversion : accum
								// output_type_conversion : (accum_lv0_0_0_1[hls_map_index]).to_uint64()
								if (&(accum) != NULL) // check the null address if the c port is array or others
								{
									accum = (accum_lv0_0_0_1[hls_map_index]).to_uint64();
									hls_map_index++;
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] accum_pc_buffer;
		}

		// output port post check: "ADC"
		aesl_fh.read(AUTOTB_TVOUT_PC_ADC, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_ADC, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_ADC, AESL_token); // data

			sc_bv<32> *ADC_pc_buffer = new sc_bv<32>[1];
			int i = 0;

			while (AESL_token != "[[/transaction]]")
			{
				bool no_x = false;
				bool err = false;

				// search and replace 'X' with "0" from the 1st char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('X');
					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'ADC', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				no_x = false;

				// search and replace 'x' with "0" from the 3rd char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('x', 2);

					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'ADC', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				// push token into output port buffer
				if (AESL_token != "")
				{
					ADC_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_ADC, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_ADC))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: ADC
				{
					// bitslice(31, 0)
					// {
						// celement: ADC(31, 0)
						// {
							sc_lv<32>* ADC_lv0_0_0_1 = new sc_lv<32>[1];
						// }
					// }

					// bitslice(31, 0)
					{
						int hls_map_index = 0;
						// celement: ADC(31, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								if (&(ADC) != NULL) // check the null address if the c port is array or others
								{
									ADC_lv0_0_0_1[hls_map_index].range(31, 0) = sc_bv<32>(ADC_pc_buffer[hls_map_index].range(31, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(31, 0)
					{
						int hls_map_index = 0;
						// celement: ADC(31, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : ADC
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : ADC
								// output_left_conversion : ADC
								// output_type_conversion : (ADC_lv0_0_0_1[hls_map_index]).to_uint64()
								if (&(ADC) != NULL) // check the null address if the c port is array or others
								{
									ADC = (ADC_lv0_0_0_1[hls_map_index]).to_uint64();
									hls_map_index++;
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] ADC_pc_buffer;
		}

		AESL_transaction_pc++;
	}
	else
	{
		CodeState = ENTER_WRAPC;
		static unsigned AESL_transaction;

		static AESL_FILE_HANDLER aesl_fh;

		// "ped_val"
		char* tvin_ped_val = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_ped_val);
		char* tvout_ped_val = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_ped_val);

		// "accum"
		char* tvin_accum = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_accum);
		char* tvout_accum = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_accum);

		// "ADC"
		char* tvin_ADC = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_ADC);
		char* tvout_ADC = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_ADC);

		CodeState = DUMP_INPUTS;
		static INTER_TCL_FILE tcl_file(INTER_TCL);
		int leading_zero;

		// [[transaction]]
		sprintf(tvin_ped_val, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_ped_val, tvin_ped_val);

		sc_bv<32>* ped_val_tvin_wrapc_buffer = new sc_bv<32>[1];

		// RTL Name: ped_val
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: ped_val(31, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : ped_val
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : ped_val
						// regulate_c_name       : ped_val
						// input_type_conversion : ped_val
						if (&(ped_val) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> ped_val_tmp_mem;
							ped_val_tmp_mem = ped_val;
							ped_val_tvin_wrapc_buffer[hls_map_index].range(31, 0) = ped_val_tmp_mem.range(31, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_ped_val, "%s\n", (ped_val_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_ped_val, tvin_ped_val);
		}

		tcl_file.set_num(1, &tcl_file.ped_val_depth);
		sprintf(tvin_ped_val, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_ped_val, tvin_ped_val);

		// release memory allocation
		delete [] ped_val_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_accum, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_accum, tvin_accum);

		sc_bv<32>* accum_tvin_wrapc_buffer = new sc_bv<32>[1];

		// RTL Name: accum
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: accum(31, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : accum
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : accum
						// regulate_c_name       : accum
						// input_type_conversion : accum
						if (&(accum) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> accum_tmp_mem;
							accum_tmp_mem = accum;
							accum_tvin_wrapc_buffer[hls_map_index].range(31, 0) = accum_tmp_mem.range(31, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_accum, "%s\n", (accum_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_accum, tvin_accum);
		}

		tcl_file.set_num(1, &tcl_file.accum_depth);
		sprintf(tvin_accum, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_accum, tvin_accum);

		// release memory allocation
		delete [] accum_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_ADC, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_ADC, tvin_ADC);

		sc_bv<32>* ADC_tvin_wrapc_buffer = new sc_bv<32>[1];

		// RTL Name: ADC
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: ADC(31, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : ADC
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : ADC
						// regulate_c_name       : ADC
						// input_type_conversion : ADC
						if (&(ADC) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> ADC_tmp_mem;
							ADC_tmp_mem = ADC;
							ADC_tvin_wrapc_buffer[hls_map_index].range(31, 0) = ADC_tmp_mem.range(31, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_ADC, "%s\n", (ADC_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_ADC, tvin_ADC);
		}

		tcl_file.set_num(1, &tcl_file.ADC_depth);
		sprintf(tvin_ADC, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_ADC, tvin_ADC);

		// release memory allocation
		delete [] ADC_tvin_wrapc_buffer;

// [call_c_dut] ---------->

		CodeState = CALL_C_DUT;
		ped_alg(ped_val, accum, ADC);

		CodeState = DUMP_OUTPUTS;

		// [[transaction]]
		sprintf(tvout_ped_val, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_ped_val, tvout_ped_val);

		sc_bv<32>* ped_val_tvout_wrapc_buffer = new sc_bv<32>[1];

		// RTL Name: ped_val
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: ped_val(31, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : ped_val
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : ped_val
						// regulate_c_name       : ped_val
						// input_type_conversion : ped_val
						if (&(ped_val) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> ped_val_tmp_mem;
							ped_val_tmp_mem = ped_val;
							ped_val_tvout_wrapc_buffer[hls_map_index].range(31, 0) = ped_val_tmp_mem.range(31, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvout_ped_val, "%s\n", (ped_val_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_ped_val, tvout_ped_val);
		}

		tcl_file.set_num(1, &tcl_file.ped_val_depth);
		sprintf(tvout_ped_val, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_ped_val, tvout_ped_val);

		// release memory allocation
		delete [] ped_val_tvout_wrapc_buffer;

		// [[transaction]]
		sprintf(tvout_accum, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_accum, tvout_accum);

		sc_bv<32>* accum_tvout_wrapc_buffer = new sc_bv<32>[1];

		// RTL Name: accum
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: accum(31, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : accum
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : accum
						// regulate_c_name       : accum
						// input_type_conversion : accum
						if (&(accum) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> accum_tmp_mem;
							accum_tmp_mem = accum;
							accum_tvout_wrapc_buffer[hls_map_index].range(31, 0) = accum_tmp_mem.range(31, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvout_accum, "%s\n", (accum_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_accum, tvout_accum);
		}

		tcl_file.set_num(1, &tcl_file.accum_depth);
		sprintf(tvout_accum, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_accum, tvout_accum);

		// release memory allocation
		delete [] accum_tvout_wrapc_buffer;

		// [[transaction]]
		sprintf(tvout_ADC, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_ADC, tvout_ADC);

		sc_bv<32>* ADC_tvout_wrapc_buffer = new sc_bv<32>[1];

		// RTL Name: ADC
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: ADC(31, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : ADC
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : ADC
						// regulate_c_name       : ADC
						// input_type_conversion : ADC
						if (&(ADC) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> ADC_tmp_mem;
							ADC_tmp_mem = ADC;
							ADC_tvout_wrapc_buffer[hls_map_index].range(31, 0) = ADC_tmp_mem.range(31, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvout_ADC, "%s\n", (ADC_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_ADC, tvout_ADC);
		}

		tcl_file.set_num(1, &tcl_file.ADC_depth);
		sprintf(tvout_ADC, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_ADC, tvout_ADC);

		// release memory allocation
		delete [] ADC_tvout_wrapc_buffer;

		CodeState = DELETE_CHAR_BUFFERS;
		// release memory allocation: "ped_val"
		delete [] tvin_ped_val;
		delete [] tvout_ped_val;
		// release memory allocation: "accum"
		delete [] tvin_accum;
		delete [] tvout_accum;
		// release memory allocation: "ADC"
		delete [] tvin_ADC;
		delete [] tvout_ADC;

		AESL_transaction++;

		tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
	}
}

