# Project info:

Source file: functions.cpp

Test bench: pedsub\_test.cpp

Header file: functions.h

Top function: ped\_alg

## Running the project

To initialise the solution, type ``vivado_hls -f run_hls.tcl`` in the command
line after sourcing settings.64 in your Vivado directory. To open the project,
type ``vivado_hls -p ped_sub_proj``

## Configuration

To configure pedestal estimate, packet size, ADC range and more, see the
first section of functions.h

### Running test bench

Choose a PED\_EST value in range < ``R_MIN - <int>N_SAMPLES/10`` or
> ``R_max + <int>N_SAMPLES/10``. 

