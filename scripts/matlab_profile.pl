#!/usr/bin/perl

################################################################################
#
# Script to convert MATLAB profiler output into CSV format. Processes data as
# produced by the `matlab_profile.sh' script.
#
# Usage:
#     ./matlab-profile.pl input
#
# Input:  Base directory where the profiler output is found. Should contain 
#         subdirectories named after the data sets that the data pertains to.
#         Each data set subdirectory should contain a single subdirectory for 
#         each iteration of the Matlab code. The input format should be a 
#         directory hierarchy with the following structure:
#             `{data-set}/{iteration}/{profile}`
# Output: Profiler data in CSV format. Outputs to STDOUT.
#
################################################################################

use strict;
use warnings;

use File::Spec;

use constant PROFILE_HTML_FILE => "file0.html";
use constant OUTPUT_HEADER     => "Profile,Data set,Iteration,Function Name,Calls,Calls (relative),Total time,Total time (relative),Self time,Self time (relative)\n";

use FindBin;
use lib $FindBin::Bin;
require "util.pl";

# The argument should be the base directory for the profiling data
scalar(@ARGV) >= 1 || die("No directory specified!\n");
my $base_dir = $ARGV[0];
-d $base_dir || die("Directory doesn't exist: $base_dir\n");

# Get data sets from subdirectories below base directory
my @dataset_dirs = next_subdirectory_level($base_dir);

# Print header of output
print(OUTPUT_HEADER);

# A hashmap for the profiling results
#     all_results{'profile_name'}{'data_type'}
#
# Where 'data' is one of the following:
#     - calls               Total number of calls to each function, across all data sets.
#     - total_time          Total time for each function, across all data sets.
#     - self_time           Total self time for each function, across all data sets.
#     - iterations          Total iterations across all data sets.
my %all_results = ();

# Loop through each data set
for my $dataset_dir (@dataset_dirs) {
    my $dataset = strip_directory($dataset_dir);
    
    # Get iterations from next subdirectory level
    my @iteration_dirs = next_subdirectory_level($dataset_dir);
    
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
        
        # Get profiles from next subdirectory level
        my @profile_dirs = next_subdirectory_level($iteration_dir);
        
        # Loop through each profile subdirectory
        for my $profile_dir (@profile_dirs) {
            my $profile = strip_directory($profile_dir);
            
            # Check if the profile exists in the results hash
            if (!exists $all_results{$profile}) {
                $all_results{$profile} = ();
                $all_results{$profile}{'calls'} = ();
                $all_results{$profile}{'totaltime'} = ();
                $all_results{$profile}{'selftime'} = ();
                
                $all_results{$profile}{'total_calls'} = 0;
                $all_results{$profile}{'total_totaltime'} = 0;
                $all_results{$profile}{'total_selftime'} = 0;
                $all_results{$profile}{'iterations'} = 0;
            }
            if (!exists $results{$profile}) {
                $results{$profile} = ();
                $results{$profile}{'calls'} = ();
                $results{$profile}{'totaltime'} = ();
                $results{$profile}{'selftime'} = ();
                
                $results{$profile}{'total_calls'} = 0;
                $results{$profile}{'total_totaltime'} = 0;
                $results{$profile}{'total_selftime'} = 0;
                $results{$profile}{'iterations'} = 0;
            }
            
            # Retrieve the input HTML file
            my $profile_html_file = File::Spec->catfile($profile_dir, PROFILE_HTML_FILE);
            my @data_rows = get_table_rows($profile_html_file);
            
            # We have seen another iteration
            ($all_results{$profile}{'iterations'})++;
            ($results{$profile}{'iterations'})++;
            
            # Output the data, looping through each row
            foreach my $row (@data_rows) {
                my $function   = html_parse_function_name($row);
                my $calls      = html_parse_function_calls($row);
                my $total_time = html_parse_function_total_time($row);
                my $self_time  = html_parse_function_self_time($row);
                
                $results    {$profile}{'calls'}{$function}     += $calls;
                $all_results{$profile}{'calls'}{$function}     += $calls;
                $results    {$profile}{'total_calls'}          += $calls;
                $all_results{$profile}{'total_calls'}          += $calls;
                
                $results    {$profile}{'totaltime'}{$function} += $total_time;
                $all_results{$profile}{'totaltime'}{$function} += $total_time;
                $results    {$profile}{'total_totaltime'}      += $total_time;
                $all_results{$profile}{'total_totaltime'}      += $total_time;
                
                $results    {$profile}{'selftime'}{$function}  += $self_time;
                $all_results{$profile}{'selftime'}{$function}  += $self_time;
                $results    {$profile}{'total_selftime'}       += $self_time;
                $all_results{$profile}{'total_selftime'}       += $self_time;
                
                # For testing
                print("\"$profile\",\"$dataset\",$iteration,\"$function\",$calls,,$total_time,,$self_time,\n");
            }
        }
    }
    
    # Output averages over this data set
    my @profiles = sort(keys(%results));
    foreach my $profile (@profiles) {
        my @functions = sort(keys(%{$results{"$profile"}{'calls'}}));
        
        foreach my $function (@functions) {
            my $calls_average      = $results{$profile}{'calls'}{$function} / $results{$profile}{'iterations'};
            my $calls_relative     = $results{$profile}{'calls'}{$function} / $results{$profile}{'total_calls'};
            my $totaltime_average  = $results{$profile}{'totaltime'}{$function} / $results{$profile}{'iterations'};
            my $totaltime_relative = $results{$profile}{'totaltime'}{$function} / $results{$profile}{'total_totaltime'};
            my $selftime_average   = $results{$profile}{'selftime'}{$function} / $results{$profile}{'iterations'};
            my $selftime_relative  = $results{$profile}{'selftime'}{$function} / $results{$profile}{'total_selftime'};
            
            print("\"$profile\",\"$dataset\",\"average\",\"$function\",$calls_average,$calls_relative,$totaltime_average,$totaltime_relative,$selftime_average,$selftime_relative\n");
        }
    }
}
