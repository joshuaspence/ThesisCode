#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/duncanm/autoesl_release_dirs_FINAL/examples/coding/cpp_ap_fixed/proj_cpp_ap_fixed.prj/solution1/.autopilot/db/a.g.bc ${1+"$@"}
