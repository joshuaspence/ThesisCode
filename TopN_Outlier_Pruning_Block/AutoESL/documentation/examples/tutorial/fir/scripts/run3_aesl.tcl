##############################################
# Project settings
open_project	fir

add_file			fir.c -cflags "-DBIT_ACCURATE"
add_file -tb	fir_test.c -cflags "-DBIT_ACCURATE"
add_file -tb	out.gold.8.dat

set_top		fir

###########################
# Solution settings
open_solution -reset solution3

set_part  {xc6vlx240tff1156-2}
create_clock -period 10
set_clock_uncertainty 1.25

# Solution settings
set_directive_resource -core SPRAM "fir" c
set_directive_interface -mode ap_vld "fir" x

# Elaborate 
elaborate 

# Synthesis 
autosyn

# RTL Verification
autosim

# RTL Implementation
autoimpl

exit
