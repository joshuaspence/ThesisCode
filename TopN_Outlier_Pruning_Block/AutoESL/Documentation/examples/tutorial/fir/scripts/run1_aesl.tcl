##############################################
# Project settings
open_project	-reset fir

add_file			fir.c 
add_file -tb	fir_test.c
add_file -tb	out.gold.dat

set_top		fir

###########################
# Solution settings
open_solution -reset solution1

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
