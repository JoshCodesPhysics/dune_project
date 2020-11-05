#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/joshhorswill10/Documents/dune_project/ped_sub/ped_sub_prj/individual_latency/.autopilot/db/a.g.bc ${1+"$@"}
