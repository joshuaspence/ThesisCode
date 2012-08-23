#!/bin/bash

#===============================================================================
# Modes
#===============================================================================

clean_matlab() {
    echo "Cleaning..."
    rm --force --verbose graph.{mat,txt} output.{csv,png} random.{mat,txt} TopN_Outlier_Pruning_Block.{mat,txt} vars.dat
}

clean_profiling() {
    echo "Cleaning profiling data..."
    rm --force --verbose --recursive Profiling/
}

clean_testing() {
    echo "Cleaning testing files..."
    rm --force --verbose --recursive Testing/
}
#-------------------------------------------------------------------------------

#===============================================================================
# Usage
#===============================================================================
usage() {
    cat << EOF
usage:
    $0 [MODES...]

This script cleans out the MATLAB directory.

MODES
    all
    matlab
    profiling
    testing
EOF
}
#-------------------------------------------------------------------------------

if [[ $# -eq 0 ]]; then
    echo "No mode specified." >&2
    echo
    usage
fi

for opt in $@; do
    case $opt in
        matlab)
            clean_matlab
            ;;
            
        profiling)
            clean_profiling
            ;;
        
        testing)
            clean_testing
            ;;
        
        all)
            clean_matlab
            clean_profiling
            clean_testing
            ;;
        
       *)
	        # terminate while loop
	        break
	        ;;

    esac
done
