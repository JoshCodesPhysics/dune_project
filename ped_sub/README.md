# Project info:

Source file: functions.cpp

Test benches: pedsub\_test.cpp, pedsub\_test2.cpp

Header file: functions.h

Top function: ped\_alg

## Running the project

To initialise the solution, type ``vivado_hls -f run_hls.tcl`` in the command
line after sourcing settings.64 in your Vivado directory. To open the project,
type ``vivado_hls -p ped_sub_proj``

## Configuration

To configure pedestal estimate, packet size, ADC range and more, see the
first section of the main() function

## Setting a test bench

Vivado HLS can only process one test bench at a time, so make sure you have your desired test bench set within the tcl file or the GUI menu.

### Running test bench #1: ``pedsub_test.cpp``

Choose a PED\_EST value in range \< ``R_MIN - <int>N_SAMPLES/10`` or \> ``R_max + <int>N_SAMPLES/10``. 

Variable configuration can be gleaned from the extensive comments at the start of main()

### Running test bench #2: ``pedsub_test2.cpp``

- Make sure the variable ``input_file`` is set to the full path directory of the data file being parsed

- Set ``NUM_PACKETS`` to the number of data packets to be parsed within the data file
- Set ``PACKET_SIZE`` to the number of samples within a given packet
- Set ``CONVERGE_VALUE`` to the expected pedestal value found after the set number of packets
- Set ``PED_VAL`` to the desired pedestal estimate value that ``ped_alg`` will start with
