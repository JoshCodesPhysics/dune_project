#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /net/home/ppd/hmo31799/Documents/dune_project/ped_sub/ped_sub_prj/tready_treset_solution/.autopilot/db/a.g.bc ${1+"$@"}
