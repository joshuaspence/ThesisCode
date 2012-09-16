#!/usr/bin/perl

################################################################################
#
# Script to convert C profiler output into CSV format. Processes data as
# produced by the `c_profile.sh' script.
#
# Usage:
#     ./parse_c_profile.pl INPUT
#
# Input:  Base directory where the profiler output is found. Should contain 
#         subdirectories named after the data sets that the data pertains to.
#         Each data set subdirectory should contain a single subdirectory for 
#         each iteration of the MATLAB code. The input format should be a 
#         directory hierarchy with the following structure:
#             `{data-set}/{iteration}/{profile}`
# Output: Profiler data in CSV format. Outputs to STDOUT.
#
################################################################################

use strict;
use warnings;

use constant GPROF_FILE        => 'gprof.txt';
use constant OUTPUT_HEADER     => "Data set,Iteration,Profile,Function,Calls,Self time,Total time\n";

use FindBin;
use lib $FindBin::Bin;
require 'util.pl';

# The argument should be the base directory for the profiling data
scalar(@ARGV) >= 1 || die('No directory specified!');
my $base_dir = $ARGV[0];
-d $base_dir || die("Directory doesn't exist: $base_dir");

# Get data sets from subdirectories below base directory
my @dataset_dirs = next_subdirectory_level($base_dir);

# Print header of output
print(OUTPUT_HEADER);

# Loop through each data set
for my $dataset_dir (@dataset_dirs) {
    my $dataset = strip_directory($dataset_dir);
    
    # Get iterations from next subdirectory level
    my @iteration_dirs = next_subdirectory_level($dataset_dir);
    
    # Loop through each iteration subdirectory
    for my $iteration_dir (@iteration_dirs) {
        my $iteration = strip_directory($iteration_dir);
        
        # Get block sizes from next subdirectory level
        my @profile_dirs = next_subdirectory_level($iteration_dir);
        
        # Loop through each profile subdirectory
        for my $profile_dir (@profile_dirs) {
            my $profile = strip_directory($profile_dir);
            
            # Parse the gprof output file
            my $gprof_file = "$profile_dir/" . GPROF_FILE;
            open(GPROF, $gprof_file) || die("Could not open file: $gprof_file");
            my $data_active = 0;
            while (my $line = <GPROF>) {
                if ($line =~ m/^\s*time\s+seconds\s+seconds\s+calls\s+ms\/call\s+ms\/call\s+name\s*$/) {
                    $data_active = 1;
                } elsif ($line =~ m/^\s*$/) {
                    $data_active = 0;
                }
                
                if ($data_active && $line =~ m/\s*(\d+\.\d+)\s+(\d+\.\d+)\s+(\d+)\s+(\d+\.\d+)\s+(\d+\.\d+)\s+(.+)/) {
                    print "\"$dataset\",$iteration,\"$profile\",\"$6\",$3,$4,$5\n"
                }
            }
            close(GPROF);
        }
    }
}
