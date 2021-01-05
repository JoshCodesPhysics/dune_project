// ==============================================================
// File generated on Thu Dec 17 13:41:49 GMT 2020
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:36:41 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
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
#define AUTOTB_TVOUT_ADC  "../tv/cdatafile/c.ped_alg.autotvout_ADC.dat"
// wrapc file define: "tdata"
#define AUTOTB_TVIN_tdata  "../tv/cdatafile/c.ped_alg.autotvin_tdata.dat"
// wrapc file define: "tvalid"
#define AUTOTB_TVIN_tvalid  "../tv/cdatafile/c.ped_alg.autotvin_tvalid.dat"
// wrapc file define: "tkeep0"
#define AUTOTB_TVIN_tkeep0  "../tv/cdatafile/c.ped_alg.autotvin_tkeep0.dat"
// wrapc file define: "tkeep1"
#define AUTOTB_TVIN_tkeep1  "../tv/cdatafile/c.ped_alg.autotvin_tkeep1.dat"
// wrapc file define: "tready"
#define AUTOTB_TVIN_tready  "../tv/cdatafile/c.ped_alg.autotvin_tready.dat"
// wrapc file define: "treset"
#define AUTOTB_TVIN_treset  "../tv/cdatafile/c.ped_alg.autotvin_treset.dat"
// wrapc file define: "tlast"
#define AUTOTB_TVIN_tlast  "../tv/cdatafile/c.ped_alg.autotvin_tlast.dat"
// wrapc file define: "tvalid_out"
#define AUTOTB_TVOUT_tvalid_out  "../tv/cdatafile/c.ped_alg.autotvout_tvalid_out.dat"
// wrapc file define: "tkeep0_out"
#define AUTOTB_TVOUT_tkeep0_out  "../tv/cdatafile/c.ped_alg.autotvout_tkeep0_out.dat"
// wrapc file define: "tkeep1_out"
#define AUTOTB_TVOUT_tkeep1_out  "../tv/cdatafile/c.ped_alg.autotvout_tkeep1_out.dat"
// wrapc file define: "tready_out"
#define AUTOTB_TVOUT_tready_out  "../tv/cdatafile/c.ped_alg.autotvout_tready_out.dat"
// wrapc file define: "treset_out"
#define AUTOTB_TVOUT_treset_out  "../tv/cdatafile/c.ped_alg.autotvout_treset_out.dat"
// wrapc file define: "tlast_out"
#define AUTOTB_TVOUT_tlast_out  "../tv/cdatafile/c.ped_alg.autotvout_tlast_out.dat"

#define INTER_TCL  "../tv/cdatafile/ref.tcl"

// tvout file define: "ped_val"
#define AUTOTB_TVOUT_PC_ped_val  "../tv/rtldatafile/rtl.ped_alg.autotvout_ped_val.dat"
// tvout file define: "accum"
#define AUTOTB_TVOUT_PC_accum  "../tv/rtldatafile/rtl.ped_alg.autotvout_accum.dat"
// tvout file define: "ADC"
#define AUTOTB_TVOUT_PC_ADC  "../tv/rtldatafile/rtl.ped_alg.autotvout_ADC.dat"
// tvout file define: "tvalid_out"
#define AUTOTB_TVOUT_PC_tvalid_out  "../tv/rtldatafile/rtl.ped_alg.autotvout_tvalid_out.dat"
// tvout file define: "tkeep0_out"
#define AUTOTB_TVOUT_PC_tkeep0_out  "../tv/rtldatafile/rtl.ped_alg.autotvout_tkeep0_out.dat"
// tvout file define: "tkeep1_out"
#define AUTOTB_TVOUT_PC_tkeep1_out  "../tv/rtldatafile/rtl.ped_alg.autotvout_tkeep1_out.dat"
// tvout file define: "tready_out"
#define AUTOTB_TVOUT_PC_tready_out  "../tv/rtldatafile/rtl.ped_alg.autotvout_tready_out.dat"
// tvout file define: "treset_out"
#define AUTOTB_TVOUT_PC_treset_out  "../tv/rtldatafile/rtl.ped_alg.autotvout_treset_out.dat"
// tvout file define: "tlast_out"
#define AUTOTB_TVOUT_PC_tlast_out  "../tv/rtldatafile/rtl.ped_alg.autotvout_tlast_out.dat"

class INTER_TCL_FILE {
	public:
		INTER_TCL_FILE(const char* name) {
			mName = name;
			ped_val_depth = 0;
			accum_depth = 0;
			ADC_depth = 0;
			tdata_depth = 0;
			tvalid_depth = 0;
			tkeep0_depth = 0;
			tkeep1_depth = 0;
			tready_depth = 0;
			treset_depth = 0;
			tlast_depth = 0;
			tvalid_out_depth = 0;
			tkeep0_out_depth = 0;
			tkeep1_out_depth = 0;
			tready_out_depth = 0;
			treset_out_depth = 0;
			tlast_out_depth = 0;
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
			total_list << "{tdata " << tdata_depth << "}\n";
			total_list << "{tvalid " << tvalid_depth << "}\n";
			total_list << "{tkeep0 " << tkeep0_depth << "}\n";
			total_list << "{tkeep1 " << tkeep1_depth << "}\n";
			total_list << "{tready " << tready_depth << "}\n";
			total_list << "{treset " << treset_depth << "}\n";
			total_list << "{tlast " << tlast_depth << "}\n";
			total_list << "{tvalid_out " << tvalid_out_depth << "}\n";
			total_list << "{tkeep0_out " << tkeep0_out_depth << "}\n";
			total_list << "{tkeep1_out " << tkeep1_out_depth << "}\n";
			total_list << "{tready_out " << tready_out_depth << "}\n";
			total_list << "{treset_out " << treset_out_depth << "}\n";
			total_list << "{tlast_out " << tlast_out_depth << "}\n";
			return total_list.str();
		}

		void set_num (int num , int* class_num) {
			(*class_num) = (*class_num) > num ? (*class_num) : num;
		}
	public:
		int ped_val_depth;
		int accum_depth;
		int ADC_depth;
		int tdata_depth;
		int tvalid_depth;
		int tkeep0_depth;
		int tkeep1_depth;
		int tready_depth;
		int treset_depth;
		int tlast_depth;
		int tvalid_out_depth;
		int tkeep0_out_depth;
		int tkeep1_out_depth;
		int tready_out_depth;
		int treset_out_depth;
		int tlast_out_depth;
		int trans_num;

	private:
		ofstream mFile;
		const char* mName;
};

extern void ped_alg (
short* ped_val,
char* accum,
short* ADC,
short* tdata,
bool* tvalid,
bool* tkeep0,
bool* tkeep1,
bool* tready,
bool* treset,
bool* tlast,
bool* tvalid_out,
bool* tkeep0_out,
bool* tkeep1_out,
bool* tready_out,
bool* treset_out,
bool* tlast_out);

void AESL_WRAP_ped_alg (
short* ped_val,
char* accum,
short* ADC,
short* tdata,
bool* tvalid,
bool* tkeep0,
bool* tkeep1,
bool* tready,
bool* treset,
bool* tlast,
bool* tvalid_out,
bool* tkeep0_out,
bool* tkeep1_out,
bool* tready_out,
bool* treset_out,
bool* tlast_out)
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

			sc_bv<16> *ped_val_pc_buffer = new sc_bv<16>[1];
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
					// bitslice(15, 0)
					// {
						// celement: ped_val(15, 0)
						// {
							sc_lv<16>* ped_val_lv0_0_0_1 = new sc_lv<16>[1];
						// }
					// }

					// bitslice(15, 0)
					{
						int hls_map_index = 0;
						// celement: ped_val(15, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								if (&(ped_val[0]) != NULL) // check the null address if the c port is array or others
								{
									ped_val_lv0_0_0_1[hls_map_index].range(15, 0) = sc_bv<16>(ped_val_pc_buffer[hls_map_index].range(15, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(15, 0)
					{
						int hls_map_index = 0;
						// celement: ped_val(15, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : ped_val[i_0]
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : ped_val[0]
								// output_left_conversion : ped_val[i_0]
								// output_type_conversion : (ped_val_lv0_0_0_1[hls_map_index]).to_uint64()
								if (&(ped_val[0]) != NULL) // check the null address if the c port is array or others
								{
									ped_val[i_0] = (ped_val_lv0_0_0_1[hls_map_index]).to_uint64();
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

			sc_bv<8> *accum_pc_buffer = new sc_bv<8>[1];
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
					// bitslice(7, 0)
					// {
						// celement: accum(7, 0)
						// {
							sc_lv<8>* accum_lv0_0_0_1 = new sc_lv<8>[1];
						// }
					// }

					// bitslice(7, 0)
					{
						int hls_map_index = 0;
						// celement: accum(7, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								if (&(accum[0]) != NULL) // check the null address if the c port is array or others
								{
									accum_lv0_0_0_1[hls_map_index].range(7, 0) = sc_bv<8>(accum_pc_buffer[hls_map_index].range(7, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(7, 0)
					{
						int hls_map_index = 0;
						// celement: accum(7, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : accum[i_0]
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : accum[0]
								// output_left_conversion : accum[i_0]
								// output_type_conversion : (accum_lv0_0_0_1[hls_map_index]).to_uint64()
								if (&(accum[0]) != NULL) // check the null address if the c port is array or others
								{
									accum[i_0] = (accum_lv0_0_0_1[hls_map_index]).to_uint64();
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

			sc_bv<16> *ADC_pc_buffer = new sc_bv<16>[1];
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
					// bitslice(15, 0)
					// {
						// celement: ADC(15, 0)
						// {
							sc_lv<16>* ADC_lv0_0_0_1 = new sc_lv<16>[1];
						// }
					// }

					// bitslice(15, 0)
					{
						int hls_map_index = 0;
						// celement: ADC(15, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								if (&(ADC[0]) != NULL) // check the null address if the c port is array or others
								{
									ADC_lv0_0_0_1[hls_map_index].range(15, 0) = sc_bv<16>(ADC_pc_buffer[hls_map_index].range(15, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(15, 0)
					{
						int hls_map_index = 0;
						// celement: ADC(15, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : ADC[i_0]
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : ADC[0]
								// output_left_conversion : ADC[i_0]
								// output_type_conversion : (ADC_lv0_0_0_1[hls_map_index]).to_uint64()
								if (&(ADC[0]) != NULL) // check the null address if the c port is array or others
								{
									ADC[i_0] = (ADC_lv0_0_0_1[hls_map_index]).to_uint64();
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

		// output port post check: "tvalid_out"
		aesl_fh.read(AUTOTB_TVOUT_PC_tvalid_out, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_tvalid_out, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_tvalid_out, AESL_token); // data

			sc_bv<1> *tvalid_out_pc_buffer = new sc_bv<1>[1];
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
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'tvalid_out', possible cause: There are uninitialized variables in the C design." << endl;
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
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'tvalid_out', possible cause: There are uninitialized variables in the C design." << endl;
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
					tvalid_out_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_tvalid_out, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_tvalid_out))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: tvalid_out
				{
					// bitslice(0, 0)
					// {
						// celement: tvalid_out(0, 0)
						// {
							sc_lv<1>* tvalid_out_lv0_0_0_1 = new sc_lv<1>[1];
						// }
					// }

					// bitslice(0, 0)
					{
						int hls_map_index = 0;
						// celement: tvalid_out(0, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								if (&(tvalid_out[0]) != NULL) // check the null address if the c port is array or others
								{
									tvalid_out_lv0_0_0_1[hls_map_index].range(0, 0) = sc_bv<1>(tvalid_out_pc_buffer[hls_map_index].range(0, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(0, 0)
					{
						int hls_map_index = 0;
						// celement: tvalid_out(0, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : tvalid_out[i_0]
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : tvalid_out[0]
								// output_left_conversion : tvalid_out[i_0]
								// output_type_conversion : (tvalid_out_lv0_0_0_1[hls_map_index]).to_uint64()
								if (&(tvalid_out[0]) != NULL) // check the null address if the c port is array or others
								{
									tvalid_out[i_0] = (tvalid_out_lv0_0_0_1[hls_map_index]).to_uint64();
									hls_map_index++;
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] tvalid_out_pc_buffer;
		}

		// output port post check: "tkeep0_out"
		aesl_fh.read(AUTOTB_TVOUT_PC_tkeep0_out, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_tkeep0_out, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_tkeep0_out, AESL_token); // data

			sc_bv<1> *tkeep0_out_pc_buffer = new sc_bv<1>[1];
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
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'tkeep0_out', possible cause: There are uninitialized variables in the C design." << endl;
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
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'tkeep0_out', possible cause: There are uninitialized variables in the C design." << endl;
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
					tkeep0_out_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_tkeep0_out, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_tkeep0_out))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: tkeep0_out
				{
					// bitslice(0, 0)
					// {
						// celement: tkeep0_out(0, 0)
						// {
							sc_lv<1>* tkeep0_out_lv0_0_0_1 = new sc_lv<1>[1];
						// }
					// }

					// bitslice(0, 0)
					{
						int hls_map_index = 0;
						// celement: tkeep0_out(0, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								if (&(tkeep0_out[0]) != NULL) // check the null address if the c port is array or others
								{
									tkeep0_out_lv0_0_0_1[hls_map_index].range(0, 0) = sc_bv<1>(tkeep0_out_pc_buffer[hls_map_index].range(0, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(0, 0)
					{
						int hls_map_index = 0;
						// celement: tkeep0_out(0, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : tkeep0_out[i_0]
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : tkeep0_out[0]
								// output_left_conversion : tkeep0_out[i_0]
								// output_type_conversion : (tkeep0_out_lv0_0_0_1[hls_map_index]).to_uint64()
								if (&(tkeep0_out[0]) != NULL) // check the null address if the c port is array or others
								{
									tkeep0_out[i_0] = (tkeep0_out_lv0_0_0_1[hls_map_index]).to_uint64();
									hls_map_index++;
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] tkeep0_out_pc_buffer;
		}

		// output port post check: "tkeep1_out"
		aesl_fh.read(AUTOTB_TVOUT_PC_tkeep1_out, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_tkeep1_out, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_tkeep1_out, AESL_token); // data

			sc_bv<1> *tkeep1_out_pc_buffer = new sc_bv<1>[1];
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
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'tkeep1_out', possible cause: There are uninitialized variables in the C design." << endl;
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
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'tkeep1_out', possible cause: There are uninitialized variables in the C design." << endl;
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
					tkeep1_out_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_tkeep1_out, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_tkeep1_out))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: tkeep1_out
				{
					// bitslice(0, 0)
					// {
						// celement: tkeep1_out(0, 0)
						// {
							sc_lv<1>* tkeep1_out_lv0_0_0_1 = new sc_lv<1>[1];
						// }
					// }

					// bitslice(0, 0)
					{
						int hls_map_index = 0;
						// celement: tkeep1_out(0, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								if (&(tkeep1_out[0]) != NULL) // check the null address if the c port is array or others
								{
									tkeep1_out_lv0_0_0_1[hls_map_index].range(0, 0) = sc_bv<1>(tkeep1_out_pc_buffer[hls_map_index].range(0, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(0, 0)
					{
						int hls_map_index = 0;
						// celement: tkeep1_out(0, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : tkeep1_out[i_0]
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : tkeep1_out[0]
								// output_left_conversion : tkeep1_out[i_0]
								// output_type_conversion : (tkeep1_out_lv0_0_0_1[hls_map_index]).to_uint64()
								if (&(tkeep1_out[0]) != NULL) // check the null address if the c port is array or others
								{
									tkeep1_out[i_0] = (tkeep1_out_lv0_0_0_1[hls_map_index]).to_uint64();
									hls_map_index++;
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] tkeep1_out_pc_buffer;
		}

		// output port post check: "tready_out"
		aesl_fh.read(AUTOTB_TVOUT_PC_tready_out, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_tready_out, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_tready_out, AESL_token); // data

			sc_bv<1> *tready_out_pc_buffer = new sc_bv<1>[1];
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
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'tready_out', possible cause: There are uninitialized variables in the C design." << endl;
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
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'tready_out', possible cause: There are uninitialized variables in the C design." << endl;
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
					tready_out_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_tready_out, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_tready_out))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: tready_out
				{
					// bitslice(0, 0)
					// {
						// celement: tready_out(0, 0)
						// {
							sc_lv<1>* tready_out_lv0_0_0_1 = new sc_lv<1>[1];
						// }
					// }

					// bitslice(0, 0)
					{
						int hls_map_index = 0;
						// celement: tready_out(0, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								if (&(tready_out[0]) != NULL) // check the null address if the c port is array or others
								{
									tready_out_lv0_0_0_1[hls_map_index].range(0, 0) = sc_bv<1>(tready_out_pc_buffer[hls_map_index].range(0, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(0, 0)
					{
						int hls_map_index = 0;
						// celement: tready_out(0, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : tready_out[i_0]
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : tready_out[0]
								// output_left_conversion : tready_out[i_0]
								// output_type_conversion : (tready_out_lv0_0_0_1[hls_map_index]).to_uint64()
								if (&(tready_out[0]) != NULL) // check the null address if the c port is array or others
								{
									tready_out[i_0] = (tready_out_lv0_0_0_1[hls_map_index]).to_uint64();
									hls_map_index++;
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] tready_out_pc_buffer;
		}

		// output port post check: "treset_out"
		aesl_fh.read(AUTOTB_TVOUT_PC_treset_out, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_treset_out, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_treset_out, AESL_token); // data

			sc_bv<1> *treset_out_pc_buffer = new sc_bv<1>[1];
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
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'treset_out', possible cause: There are uninitialized variables in the C design." << endl;
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
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'treset_out', possible cause: There are uninitialized variables in the C design." << endl;
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
					treset_out_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_treset_out, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_treset_out))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: treset_out
				{
					// bitslice(0, 0)
					// {
						// celement: treset_out(0, 0)
						// {
							sc_lv<1>* treset_out_lv0_0_0_1 = new sc_lv<1>[1];
						// }
					// }

					// bitslice(0, 0)
					{
						int hls_map_index = 0;
						// celement: treset_out(0, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								if (&(treset_out[0]) != NULL) // check the null address if the c port is array or others
								{
									treset_out_lv0_0_0_1[hls_map_index].range(0, 0) = sc_bv<1>(treset_out_pc_buffer[hls_map_index].range(0, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(0, 0)
					{
						int hls_map_index = 0;
						// celement: treset_out(0, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : treset_out[i_0]
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : treset_out[0]
								// output_left_conversion : treset_out[i_0]
								// output_type_conversion : (treset_out_lv0_0_0_1[hls_map_index]).to_uint64()
								if (&(treset_out[0]) != NULL) // check the null address if the c port is array or others
								{
									treset_out[i_0] = (treset_out_lv0_0_0_1[hls_map_index]).to_uint64();
									hls_map_index++;
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] treset_out_pc_buffer;
		}

		// output port post check: "tlast_out"
		aesl_fh.read(AUTOTB_TVOUT_PC_tlast_out, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_tlast_out, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_tlast_out, AESL_token); // data

			sc_bv<1> *tlast_out_pc_buffer = new sc_bv<1>[1];
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
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'tlast_out', possible cause: There are uninitialized variables in the C design." << endl;
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
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'tlast_out', possible cause: There are uninitialized variables in the C design." << endl;
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
					tlast_out_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_tlast_out, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_tlast_out))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: tlast_out
				{
					// bitslice(0, 0)
					// {
						// celement: tlast_out(0, 0)
						// {
							sc_lv<1>* tlast_out_lv0_0_0_1 = new sc_lv<1>[1];
						// }
					// }

					// bitslice(0, 0)
					{
						int hls_map_index = 0;
						// celement: tlast_out(0, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								if (&(tlast_out[0]) != NULL) // check the null address if the c port is array or others
								{
									tlast_out_lv0_0_0_1[hls_map_index].range(0, 0) = sc_bv<1>(tlast_out_pc_buffer[hls_map_index].range(0, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(0, 0)
					{
						int hls_map_index = 0;
						// celement: tlast_out(0, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : tlast_out[i_0]
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : tlast_out[0]
								// output_left_conversion : tlast_out[i_0]
								// output_type_conversion : (tlast_out_lv0_0_0_1[hls_map_index]).to_uint64()
								if (&(tlast_out[0]) != NULL) // check the null address if the c port is array or others
								{
									tlast_out[i_0] = (tlast_out_lv0_0_0_1[hls_map_index]).to_uint64();
									hls_map_index++;
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] tlast_out_pc_buffer;
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
		char* tvout_ADC = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_ADC);

		// "tdata"
		char* tvin_tdata = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_tdata);

		// "tvalid"
		char* tvin_tvalid = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_tvalid);

		// "tkeep0"
		char* tvin_tkeep0 = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_tkeep0);

		// "tkeep1"
		char* tvin_tkeep1 = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_tkeep1);

		// "tready"
		char* tvin_tready = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_tready);

		// "treset"
		char* tvin_treset = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_treset);

		// "tlast"
		char* tvin_tlast = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_tlast);

		// "tvalid_out"
		char* tvout_tvalid_out = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_tvalid_out);

		// "tkeep0_out"
		char* tvout_tkeep0_out = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_tkeep0_out);

		// "tkeep1_out"
		char* tvout_tkeep1_out = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_tkeep1_out);

		// "tready_out"
		char* tvout_tready_out = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_tready_out);

		// "treset_out"
		char* tvout_treset_out = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_treset_out);

		// "tlast_out"
		char* tvout_tlast_out = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_tlast_out);

		CodeState = DUMP_INPUTS;
		static INTER_TCL_FILE tcl_file(INTER_TCL);
		int leading_zero;

		// [[transaction]]
		sprintf(tvin_ped_val, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_ped_val, tvin_ped_val);

		sc_bv<16>* ped_val_tvin_wrapc_buffer = new sc_bv<16>[1];

		// RTL Name: ped_val
		{
			// bitslice(15, 0)
			{
				int hls_map_index = 0;
				// celement: ped_val(15, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : ped_val[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : ped_val[0]
						// regulate_c_name       : ped_val
						// input_type_conversion : ped_val[i_0]
						if (&(ped_val[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<16> ped_val_tmp_mem;
							ped_val_tmp_mem = ped_val[i_0];
							ped_val_tvin_wrapc_buffer[hls_map_index].range(15, 0) = ped_val_tmp_mem.range(15, 0);
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

		sc_bv<8>* accum_tvin_wrapc_buffer = new sc_bv<8>[1];

		// RTL Name: accum
		{
			// bitslice(7, 0)
			{
				int hls_map_index = 0;
				// celement: accum(7, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : accum[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : accum[0]
						// regulate_c_name       : accum
						// input_type_conversion : accum[i_0]
						if (&(accum[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<8> accum_tmp_mem;
							accum_tmp_mem = accum[i_0];
							accum_tvin_wrapc_buffer[hls_map_index].range(7, 0) = accum_tmp_mem.range(7, 0);
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
		sprintf(tvin_tdata, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_tdata, tvin_tdata);

		sc_bv<16>* tdata_tvin_wrapc_buffer = new sc_bv<16>[1];

		// RTL Name: tdata
		{
			// bitslice(15, 0)
			{
				int hls_map_index = 0;
				// celement: tdata(15, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : tdata[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : tdata[0]
						// regulate_c_name       : tdata
						// input_type_conversion : tdata[i_0]
						if (&(tdata[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<16> tdata_tmp_mem;
							tdata_tmp_mem = tdata[i_0];
							tdata_tvin_wrapc_buffer[hls_map_index].range(15, 0) = tdata_tmp_mem.range(15, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_tdata, "%s\n", (tdata_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_tdata, tvin_tdata);
		}

		tcl_file.set_num(1, &tcl_file.tdata_depth);
		sprintf(tvin_tdata, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_tdata, tvin_tdata);

		// release memory allocation
		delete [] tdata_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_tvalid, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_tvalid, tvin_tvalid);

		sc_bv<1>* tvalid_tvin_wrapc_buffer = new sc_bv<1>[1];

		// RTL Name: tvalid
		{
			// bitslice(0, 0)
			{
				int hls_map_index = 0;
				// celement: tvalid(0, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : tvalid[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : tvalid[0]
						// regulate_c_name       : tvalid
						// input_type_conversion : tvalid[i_0]
						if (&(tvalid[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<1> tvalid_tmp_mem;
							tvalid_tmp_mem = tvalid[i_0];
							tvalid_tvin_wrapc_buffer[hls_map_index].range(0, 0) = tvalid_tmp_mem.range(0, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_tvalid, "%s\n", (tvalid_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_tvalid, tvin_tvalid);
		}

		tcl_file.set_num(1, &tcl_file.tvalid_depth);
		sprintf(tvin_tvalid, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_tvalid, tvin_tvalid);

		// release memory allocation
		delete [] tvalid_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_tkeep0, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_tkeep0, tvin_tkeep0);

		sc_bv<1>* tkeep0_tvin_wrapc_buffer = new sc_bv<1>[1];

		// RTL Name: tkeep0
		{
			// bitslice(0, 0)
			{
				int hls_map_index = 0;
				// celement: tkeep0(0, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : tkeep0[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : tkeep0[0]
						// regulate_c_name       : tkeep0
						// input_type_conversion : tkeep0[i_0]
						if (&(tkeep0[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<1> tkeep0_tmp_mem;
							tkeep0_tmp_mem = tkeep0[i_0];
							tkeep0_tvin_wrapc_buffer[hls_map_index].range(0, 0) = tkeep0_tmp_mem.range(0, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_tkeep0, "%s\n", (tkeep0_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_tkeep0, tvin_tkeep0);
		}

		tcl_file.set_num(1, &tcl_file.tkeep0_depth);
		sprintf(tvin_tkeep0, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_tkeep0, tvin_tkeep0);

		// release memory allocation
		delete [] tkeep0_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_tkeep1, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_tkeep1, tvin_tkeep1);

		sc_bv<1>* tkeep1_tvin_wrapc_buffer = new sc_bv<1>[1];

		// RTL Name: tkeep1
		{
			// bitslice(0, 0)
			{
				int hls_map_index = 0;
				// celement: tkeep1(0, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : tkeep1[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : tkeep1[0]
						// regulate_c_name       : tkeep1
						// input_type_conversion : tkeep1[i_0]
						if (&(tkeep1[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<1> tkeep1_tmp_mem;
							tkeep1_tmp_mem = tkeep1[i_0];
							tkeep1_tvin_wrapc_buffer[hls_map_index].range(0, 0) = tkeep1_tmp_mem.range(0, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_tkeep1, "%s\n", (tkeep1_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_tkeep1, tvin_tkeep1);
		}

		tcl_file.set_num(1, &tcl_file.tkeep1_depth);
		sprintf(tvin_tkeep1, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_tkeep1, tvin_tkeep1);

		// release memory allocation
		delete [] tkeep1_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_tready, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_tready, tvin_tready);

		sc_bv<1>* tready_tvin_wrapc_buffer = new sc_bv<1>[1];

		// RTL Name: tready
		{
			// bitslice(0, 0)
			{
				int hls_map_index = 0;
				// celement: tready(0, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : tready[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : tready[0]
						// regulate_c_name       : tready
						// input_type_conversion : tready[i_0]
						if (&(tready[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<1> tready_tmp_mem;
							tready_tmp_mem = tready[i_0];
							tready_tvin_wrapc_buffer[hls_map_index].range(0, 0) = tready_tmp_mem.range(0, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_tready, "%s\n", (tready_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_tready, tvin_tready);
		}

		tcl_file.set_num(1, &tcl_file.tready_depth);
		sprintf(tvin_tready, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_tready, tvin_tready);

		// release memory allocation
		delete [] tready_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_treset, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_treset, tvin_treset);

		sc_bv<1>* treset_tvin_wrapc_buffer = new sc_bv<1>[1];

		// RTL Name: treset
		{
			// bitslice(0, 0)
			{
				int hls_map_index = 0;
				// celement: treset(0, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : treset[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : treset[0]
						// regulate_c_name       : treset
						// input_type_conversion : treset[i_0]
						if (&(treset[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<1> treset_tmp_mem;
							treset_tmp_mem = treset[i_0];
							treset_tvin_wrapc_buffer[hls_map_index].range(0, 0) = treset_tmp_mem.range(0, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_treset, "%s\n", (treset_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_treset, tvin_treset);
		}

		tcl_file.set_num(1, &tcl_file.treset_depth);
		sprintf(tvin_treset, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_treset, tvin_treset);

		// release memory allocation
		delete [] treset_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_tlast, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_tlast, tvin_tlast);

		sc_bv<1>* tlast_tvin_wrapc_buffer = new sc_bv<1>[1];

		// RTL Name: tlast
		{
			// bitslice(0, 0)
			{
				int hls_map_index = 0;
				// celement: tlast(0, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : tlast[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : tlast[0]
						// regulate_c_name       : tlast
						// input_type_conversion : tlast[i_0]
						if (&(tlast[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<1> tlast_tmp_mem;
							tlast_tmp_mem = tlast[i_0];
							tlast_tvin_wrapc_buffer[hls_map_index].range(0, 0) = tlast_tmp_mem.range(0, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_tlast, "%s\n", (tlast_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_tlast, tvin_tlast);
		}

		tcl_file.set_num(1, &tcl_file.tlast_depth);
		sprintf(tvin_tlast, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_tlast, tvin_tlast);

		// release memory allocation
		delete [] tlast_tvin_wrapc_buffer;

// [call_c_dut] ---------->

		CodeState = CALL_C_DUT;
		ped_alg(ped_val, accum, ADC, tdata, tvalid, tkeep0, tkeep1, tready, treset, tlast, tvalid_out, tkeep0_out, tkeep1_out, tready_out, treset_out, tlast_out);

		CodeState = DUMP_OUTPUTS;

		// [[transaction]]
		sprintf(tvout_ped_val, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_ped_val, tvout_ped_val);

		sc_bv<16>* ped_val_tvout_wrapc_buffer = new sc_bv<16>[1];

		// RTL Name: ped_val
		{
			// bitslice(15, 0)
			{
				int hls_map_index = 0;
				// celement: ped_val(15, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : ped_val[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : ped_val[0]
						// regulate_c_name       : ped_val
						// input_type_conversion : ped_val[i_0]
						if (&(ped_val[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<16> ped_val_tmp_mem;
							ped_val_tmp_mem = ped_val[i_0];
							ped_val_tvout_wrapc_buffer[hls_map_index].range(15, 0) = ped_val_tmp_mem.range(15, 0);
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

		sc_bv<8>* accum_tvout_wrapc_buffer = new sc_bv<8>[1];

		// RTL Name: accum
		{
			// bitslice(7, 0)
			{
				int hls_map_index = 0;
				// celement: accum(7, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : accum[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : accum[0]
						// regulate_c_name       : accum
						// input_type_conversion : accum[i_0]
						if (&(accum[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<8> accum_tmp_mem;
							accum_tmp_mem = accum[i_0];
							accum_tvout_wrapc_buffer[hls_map_index].range(7, 0) = accum_tmp_mem.range(7, 0);
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

		sc_bv<16>* ADC_tvout_wrapc_buffer = new sc_bv<16>[1];

		// RTL Name: ADC
		{
			// bitslice(15, 0)
			{
				int hls_map_index = 0;
				// celement: ADC(15, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : ADC[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : ADC[0]
						// regulate_c_name       : ADC
						// input_type_conversion : ADC[i_0]
						if (&(ADC[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<16> ADC_tmp_mem;
							ADC_tmp_mem = ADC[i_0];
							ADC_tvout_wrapc_buffer[hls_map_index].range(15, 0) = ADC_tmp_mem.range(15, 0);
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

		// [[transaction]]
		sprintf(tvout_tvalid_out, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_tvalid_out, tvout_tvalid_out);

		sc_bv<1>* tvalid_out_tvout_wrapc_buffer = new sc_bv<1>[1];

		// RTL Name: tvalid_out
		{
			// bitslice(0, 0)
			{
				int hls_map_index = 0;
				// celement: tvalid_out(0, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : tvalid_out[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : tvalid_out[0]
						// regulate_c_name       : tvalid_out
						// input_type_conversion : tvalid_out[i_0]
						if (&(tvalid_out[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<1> tvalid_out_tmp_mem;
							tvalid_out_tmp_mem = tvalid_out[i_0];
							tvalid_out_tvout_wrapc_buffer[hls_map_index].range(0, 0) = tvalid_out_tmp_mem.range(0, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvout_tvalid_out, "%s\n", (tvalid_out_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_tvalid_out, tvout_tvalid_out);
		}

		tcl_file.set_num(1, &tcl_file.tvalid_out_depth);
		sprintf(tvout_tvalid_out, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_tvalid_out, tvout_tvalid_out);

		// release memory allocation
		delete [] tvalid_out_tvout_wrapc_buffer;

		// [[transaction]]
		sprintf(tvout_tkeep0_out, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_tkeep0_out, tvout_tkeep0_out);

		sc_bv<1>* tkeep0_out_tvout_wrapc_buffer = new sc_bv<1>[1];

		// RTL Name: tkeep0_out
		{
			// bitslice(0, 0)
			{
				int hls_map_index = 0;
				// celement: tkeep0_out(0, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : tkeep0_out[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : tkeep0_out[0]
						// regulate_c_name       : tkeep0_out
						// input_type_conversion : tkeep0_out[i_0]
						if (&(tkeep0_out[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<1> tkeep0_out_tmp_mem;
							tkeep0_out_tmp_mem = tkeep0_out[i_0];
							tkeep0_out_tvout_wrapc_buffer[hls_map_index].range(0, 0) = tkeep0_out_tmp_mem.range(0, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvout_tkeep0_out, "%s\n", (tkeep0_out_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_tkeep0_out, tvout_tkeep0_out);
		}

		tcl_file.set_num(1, &tcl_file.tkeep0_out_depth);
		sprintf(tvout_tkeep0_out, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_tkeep0_out, tvout_tkeep0_out);

		// release memory allocation
		delete [] tkeep0_out_tvout_wrapc_buffer;

		// [[transaction]]
		sprintf(tvout_tkeep1_out, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_tkeep1_out, tvout_tkeep1_out);

		sc_bv<1>* tkeep1_out_tvout_wrapc_buffer = new sc_bv<1>[1];

		// RTL Name: tkeep1_out
		{
			// bitslice(0, 0)
			{
				int hls_map_index = 0;
				// celement: tkeep1_out(0, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : tkeep1_out[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : tkeep1_out[0]
						// regulate_c_name       : tkeep1_out
						// input_type_conversion : tkeep1_out[i_0]
						if (&(tkeep1_out[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<1> tkeep1_out_tmp_mem;
							tkeep1_out_tmp_mem = tkeep1_out[i_0];
							tkeep1_out_tvout_wrapc_buffer[hls_map_index].range(0, 0) = tkeep1_out_tmp_mem.range(0, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvout_tkeep1_out, "%s\n", (tkeep1_out_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_tkeep1_out, tvout_tkeep1_out);
		}

		tcl_file.set_num(1, &tcl_file.tkeep1_out_depth);
		sprintf(tvout_tkeep1_out, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_tkeep1_out, tvout_tkeep1_out);

		// release memory allocation
		delete [] tkeep1_out_tvout_wrapc_buffer;

		// [[transaction]]
		sprintf(tvout_tready_out, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_tready_out, tvout_tready_out);

		sc_bv<1>* tready_out_tvout_wrapc_buffer = new sc_bv<1>[1];

		// RTL Name: tready_out
		{
			// bitslice(0, 0)
			{
				int hls_map_index = 0;
				// celement: tready_out(0, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : tready_out[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : tready_out[0]
						// regulate_c_name       : tready_out
						// input_type_conversion : tready_out[i_0]
						if (&(tready_out[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<1> tready_out_tmp_mem;
							tready_out_tmp_mem = tready_out[i_0];
							tready_out_tvout_wrapc_buffer[hls_map_index].range(0, 0) = tready_out_tmp_mem.range(0, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvout_tready_out, "%s\n", (tready_out_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_tready_out, tvout_tready_out);
		}

		tcl_file.set_num(1, &tcl_file.tready_out_depth);
		sprintf(tvout_tready_out, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_tready_out, tvout_tready_out);

		// release memory allocation
		delete [] tready_out_tvout_wrapc_buffer;

		// [[transaction]]
		sprintf(tvout_treset_out, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_treset_out, tvout_treset_out);

		sc_bv<1>* treset_out_tvout_wrapc_buffer = new sc_bv<1>[1];

		// RTL Name: treset_out
		{
			// bitslice(0, 0)
			{
				int hls_map_index = 0;
				// celement: treset_out(0, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : treset_out[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : treset_out[0]
						// regulate_c_name       : treset_out
						// input_type_conversion : treset_out[i_0]
						if (&(treset_out[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<1> treset_out_tmp_mem;
							treset_out_tmp_mem = treset_out[i_0];
							treset_out_tvout_wrapc_buffer[hls_map_index].range(0, 0) = treset_out_tmp_mem.range(0, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvout_treset_out, "%s\n", (treset_out_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_treset_out, tvout_treset_out);
		}

		tcl_file.set_num(1, &tcl_file.treset_out_depth);
		sprintf(tvout_treset_out, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_treset_out, tvout_treset_out);

		// release memory allocation
		delete [] treset_out_tvout_wrapc_buffer;

		// [[transaction]]
		sprintf(tvout_tlast_out, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_tlast_out, tvout_tlast_out);

		sc_bv<1>* tlast_out_tvout_wrapc_buffer = new sc_bv<1>[1];

		// RTL Name: tlast_out
		{
			// bitslice(0, 0)
			{
				int hls_map_index = 0;
				// celement: tlast_out(0, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : tlast_out[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : tlast_out[0]
						// regulate_c_name       : tlast_out
						// input_type_conversion : tlast_out[i_0]
						if (&(tlast_out[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<1> tlast_out_tmp_mem;
							tlast_out_tmp_mem = tlast_out[i_0];
							tlast_out_tvout_wrapc_buffer[hls_map_index].range(0, 0) = tlast_out_tmp_mem.range(0, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvout_tlast_out, "%s\n", (tlast_out_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_tlast_out, tvout_tlast_out);
		}

		tcl_file.set_num(1, &tcl_file.tlast_out_depth);
		sprintf(tvout_tlast_out, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_tlast_out, tvout_tlast_out);

		// release memory allocation
		delete [] tlast_out_tvout_wrapc_buffer;

		CodeState = DELETE_CHAR_BUFFERS;
		// release memory allocation: "ped_val"
		delete [] tvin_ped_val;
		delete [] tvout_ped_val;
		// release memory allocation: "accum"
		delete [] tvin_accum;
		delete [] tvout_accum;
		// release memory allocation: "ADC"
		delete [] tvout_ADC;
		// release memory allocation: "tdata"
		delete [] tvin_tdata;
		// release memory allocation: "tvalid"
		delete [] tvin_tvalid;
		// release memory allocation: "tkeep0"
		delete [] tvin_tkeep0;
		// release memory allocation: "tkeep1"
		delete [] tvin_tkeep1;
		// release memory allocation: "tready"
		delete [] tvin_tready;
		// release memory allocation: "treset"
		delete [] tvin_treset;
		// release memory allocation: "tlast"
		delete [] tvin_tlast;
		// release memory allocation: "tvalid_out"
		delete [] tvout_tvalid_out;
		// release memory allocation: "tkeep0_out"
		delete [] tvout_tkeep0_out;
		// release memory allocation: "tkeep1_out"
		delete [] tvout_tkeep1_out;
		// release memory allocation: "tready_out"
		delete [] tvout_tready_out;
		// release memory allocation: "treset_out"
		delete [] tvout_treset_out;
		// release memory allocation: "tlast_out"
		delete [] tvout_tlast_out;

		AESL_transaction++;

		tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
	}
}

