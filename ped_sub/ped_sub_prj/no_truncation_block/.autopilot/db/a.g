#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /net/home/ppd/hmo31799/Documents/dune_project/ped_sub/ped_sub_prj/no_truncation_block/.autopilot/db/a.g.bc ${1+"$@"}
