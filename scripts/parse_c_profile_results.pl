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

use constant GPROF_FILE    => 'gprof.txt';
use constant OUTPUT_HEADER => "Profile,Data set,Iteration,Function name,Calls,Calls (relative),Self time,Self time (relative),Proportion,Proportion (relative)\n";
use constant EPSILON       => 1e-14;

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
    
    # A hashmap for the profiling results
    #     all_results{'profile_name'}{'data_type'}
    #
    # Where 'data' is one of the following:
    #     - calls               Total number of calls to each function, across all data sets.
    #     - total_time          Total time for each function, across all data sets.
    #     - self_time           Total self time for each function, across all data sets.
    #     - iterations          Total iterations across all data sets.
    my %all_results = ();
    
    # A hashmap for the profiling results
    #     results{$profile_name}{$data_type}
    #
    # Where '$data_type' is one of the following:
    #     - calls{$function}     Total number of calls to each function.
    #     - total_calls          Total number of function calls.
    #     - totaltime{$function} Total time for each function.
    #     - total_totaltime      Total time.
    #     - selftime{$function}  Total self time for each function.
    #     - total_selftime       Total self time.
    #     - iterations           Total iterations.
    my %results = ();
    
    # Loop through each iteration subdirectory
    for my $iteration_dir (@iteration_dirs) {
        my $iteration = strip_directory($iteration_dir);
        
        # Get block sizes from next subdirectory level
        my @profile_dirs = next_subdirectory_level($iteration_dir);
        
        # Loop through each profile subdirectory
        for my $profile_dir (@profile_dirs) {
            my $profile = strip_directory($profile_dir);
            
            # Check if the profile exists in the results hash
            if (!exists $all_results{$profile}) {
                $all_results{$profile}                     = ();
                $all_results{$profile}{'calls'}            = ();
                $all_results{$profile}{'selftime'}         = ();
                $all_results{$profile}{'proportion'}       = ();
                
                $all_results{$profile}{'total_calls'}      = 0;
                $all_results{$profile}{'total_selftime'}   = 0;
                $all_results{$profile}{'total_proportion'} = 0;
                $all_results{$profile}{'iterations'}       = 0;
            }
            if (!exists $results{$profile}) {
                $results{$profile}                         = ();
                $results{$profile}{'calls'}                = ();
                $results{$profile}{'selftime'}             = ();
                $results{$profile}{'proportion'}           = ();
                
                $results{$profile}{'total_calls'}          = 0;
                $results{$profile}{'total_selftime'}       = 0;
                $results{$profile}{'total_proportion'}     = 0;
                $results{$profile}{'iterations'}           = 0;
            }
            
            # We have seen another iteration
            ($all_results{$profile}{'iterations'})++;
            ($results{$profile}{'iterations'})++;
            
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
                
                if ($data_active && $line =~ m/^\s*(\d+\.\d+)\s+(\d+\.\d+)\s+(\d+\.\d+)\s+(\d+)\s+(\d+\.\d+)\s+(\d+\.\d+)\s+(.+)$/) {
                    my $function   = $7;
                    my $calls      = $4;
                    my $self_time  = $3;
                    my $proportion = $1;
                    
                    $results    {$profile}{'calls'}{$function}     += $calls;
                    $all_results{$profile}{'calls'}{$function}     += $calls;
                    $results    {$profile}{'total_calls'}          += $calls;
                    $all_results{$profile}{'total_calls'}          += $calls;
                    
                    $results    {$profile}{'selftime'}{$function}  += $self_time;
                    $all_results{$profile}{'selftime'}{$function}  += $self_time;
                    $results    {$profile}{'total_selftime'}       += $self_time;
                    $all_results{$profile}{'total_selftime'}       += $self_time;
                    
                    $results    {$profile}{'proportion'}{$function} += $proportion;
                    $all_results{$profile}{'proportion'}{$function} += $proportion;
                    $results    {$profile}{'total_proportion'}      += $proportion;
                    $all_results{$profile}{'total_totaltime'}       += $proportion;
                    
                    # For testing
                    #print "\"$profile\",\"$dataset\",$iteration,\"$function\",$calls,,$self_time,,$proportion,\n";
                }
            }
            close(GPROF);
        }
    }
    
    # Print output
    my @profiles = sort keys %results;
    foreach my $profile (@profiles) {
        my @functions = sort keys %{$results{$profile}{'calls'}};
        
        foreach my $function (@functions) {
            my $calls_average       = $results{$profile}{'calls'}{$function} / $results{$profile}{'iterations'};
            my $calls_relative      = $results{$profile}{'calls'}{$function} / $results{$profile}{'total_calls'};
            my $selftime_average    = $results{$profile}{'selftime'}{$function} / $results{$profile}{'iterations'};
            my $selftime_relative   = $results{$profile}{'selftime'}{$function} / ($results{$profile}{'total_selftime'} + EPSILON);
            my $proportion_average  = $results{$profile}{'proportion'}{$function} / $results{$profile}{'iterations'};
            my $proportion_relative = $results{$profile}{'proportion'}{$function} / $results{$profile}{'total_proportion'};
            
            print "\"$profile\",\"$dataset\",\"average\",\"$function\",$calls_average,$calls_relative,$selftime_average,$selftime_relative,$proportion_average,$proportion_relative\n";
        }
    }
}
