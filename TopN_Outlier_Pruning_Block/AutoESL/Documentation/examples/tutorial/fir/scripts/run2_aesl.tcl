##############################################
# Project settings
open_project	fir

add_file			fir.c -cflags "-DBIT_ACCURATE"
add_file -tb	fir_test.c -cflags "-DBIT_ACCURATE"
add_file -tb	out.gold.8.dat

set_top		fir

###########################
# Solution settings
open_solution -reset solution2

set_part  {xc6vlx240tff1156-2}
create_clock -period 10
set_clock_uncertainty 1.25

# Elaborate 
elaborate 

# Synthesis 
autosyn

# RTL Verification
autosim

# RTL Implementation
autoimpl

exit
