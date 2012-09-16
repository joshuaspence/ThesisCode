#!/usr/bin/perl

################################################################################
#
# Script to convert MATLAB profiler output into CSV format. Processes data as
# produced by the `matlab_profile_block_size.sh' script.
#
# Usage:
#     ./parse_block_size_results.pl input
#
# Input:  Base directory where the profiler output is found. Should contain 
#         subdirectories named after the data sets that the data pertains to.
#         Each data set subdirectory should contain a single subdirectory for 
#         each iteration of the MATLAB code. The input format should be a 
#         directory hierarchy with the following structure:
#             `{data-set}/{iteration}/{block-size}`
# Output: Profiler data in CSV format. Outputs to STDOUT.
#
################################################################################

use strict;
use warnings;

use List::Util qw[min max];

use constant PROFILE_HTML_FILE => 'file0.html';
use constant MATLAB_LOG_FILE   => 'matlab_output.log';
use constant OUTPUT_HEADER     => "Data set,Block size,Iteration,Dimensions,Vectors,Total time,Total time (normalised),Projected dimensions,Projected vectors,Function time,Function time (normalised),Distance calls,Distance calls (normalised),Pruned,Pruned (normalised)\n";

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
    
    my $dimensions;
    my $vectors;
    my $max_total_time     = 0;
    my $max_function_time  = 0;
    my $max_distance_calls = 0;
    my $max_pruned         = 0;
    
    # A hashmap for the profiling results
    #     results{'iteration'}{'block_size'}{<data>}
    #
    # Where <data> is one of the following:
    #     - dimensions
    #     - vectors
    #     - total_time
    #     - projected_dimensions
    #     - projected_vectors
    #     - function_time
    #     - distance_calls
    #     - pruned
    my %results = ();
    
    # Get iterations from next subdirectory level
    my @iteration_dirs = next_subdirectory_level($dataset_dir);
    
    # Loop through each iteration subdirectory
    for my $iteration_dir (@iteration_dirs) {
        my $iteration = strip_directory($iteration_dir);
        
        # Check if this iteration exists in the results hash
        if (!exists $results{$iteration}) {
            $results{$iteration} = ();
        }
        
        # Get block sizes from next subdirectory level
        my @block_size_dirs = next_subdirectory_level($iteration_dir);
        
        # Loop through each profile subdirectory
        for my $block_size_dir (@block_size_dirs) {
            my $block_size = html_parse_block_size($block_size_dir);
            
            # Check if this data exists in the results hash
            if (!exists $results{$iteration}{$block_size}) {
                $results{$iteration}{$block_size} = ();
            }
            
            my $projected_dimensions;
            my $projected_vectors;
            my $pruned;
            my $distance_calls = 0;
            my $total_time;
            my $function_time;
            
            # Retrieve the input HTML file
            my $profile_html_file = "$block_size_dir/" . PROFILE_HTML_FILE;
            my @data_rows = get_table_rows($profile_html_file);
            
            # Output the data, looping through each row
            foreach my $row (@data_rows) {
                my $function_name = html_parse_function_name($row);
                my $time = html_parse_function_total_time($row);
                
                if ($function_name =~ m/^commute_distance_anomaly_profiling$/) {
                    $total_time = $time;
                } elsif ($function_name =~ m/^TopN_Outlier_Pruning_Block/) {
                    $function_time = $time;
                }
            }
            
            # Parse the MATLAB log file
            my $log_file = $block_size_dir . "/" . MATLAB_LOG_FILE;
            open(LOG, $log_file) || die("Could not open $log_file");
            while (my $line = <LOG>) {                
                if ($line =~ m/Data set dimensions\s*=\s*([0-9]+)\*([0-9]+)/) {
                    $vectors = $1;
                    $dimensions = $2;
                } elsif ($line =~ m/Projected data set dimensions\s*=\s*([0-9]+)\*([0-9]+)/) {
                    $projected_vectors = $1;
                    $projected_dimensions = $2;
                } elsif ($line =~ m/Number of pruned vectors\s*=\s*([0-9]+)/) {
                    $pruned = $1;
                } elsif ($line =~ m/Calls to distance function\s*=\s*([0-9]+)/) {
                    $distance_calls = $1;
                }
            }
            close(LOG);
            
            $max_total_time     = max($total_time, $max_total_time);
            $max_function_time  = max($function_time, $max_function_time);
            $max_distance_calls = max($distance_calls, $max_distance_calls);
            $max_pruned         = max($pruned, $max_pruned);
            
            $results{$iteration}{$block_size}{'dimensions'}           = $dimensions;
            $results{$iteration}{$block_size}{'vectors'}              = $vectors;
            $results{$iteration}{$block_size}{'total_time'}           = $total_time;
            $results{$iteration}{$block_size}{'projected_dimensions'} = $projected_dimensions;
            $results{$iteration}{$block_size}{'projected_vectors'}    = $projected_vectors;
            $results{$iteration}{$block_size}{'function_time'}        = $function_time;
            $results{$iteration}{$block_size}{'distance_calls'}       = $distance_calls;
            $results{$iteration}{$block_size}{'pruned'}               = $pruned;
        }
    }
    
    # Print output
    my @iterations = keys %results;
    foreach my $iteration (@iterations) {
        my @block_sizes = sort { $a <=> $b } keys %{$results{$iteration}};
        foreach my $block_size (@block_sizes) {
            my $total_time = $results{$iteration}{$block_size}{'total_time'};
            my $total_time_normalised = $total_time / $max_total_time;
            my $projected_dimensions = $results{$iteration}{$block_size}{'projected_dimensions'};
            my $projected_vectors = $results{$iteration}{$block_size}{'projected_vectors'};
            my $function_time = $results{$iteration}{$block_size}{'function_time'};
            my $function_time_normalised = $function_time / $max_function_time;
            my $distance_calls = $results{$iteration}{$block_size}{'distance_calls'};
            my $distance_calls_normalised = $distance_calls / $max_distance_calls;
            my $pruned = $results{$iteration}{$block_size}{'pruned'};
            my $pruned_normalised = $pruned / $max_pruned;
            
            print("\"$dataset\",$block_size,$iteration,$dimensions,$vectors,$total_time,$total_time_normalised,$projected_dimensions,$projected_vectors,$function_time,$function_time_normalised,$distance_calls,$distance_calls_normalised,$pruned,$pruned_normalised\n");
        }
    }
}
