#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /data/hmo31799/ped_sub/ped_sub_prj/solution1/.autopilot/db/a.g.bc ${1+"$@"}
