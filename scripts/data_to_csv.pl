#!/usr/bin/perl

################################################################################
#
# Script to convert MATLAB profiler output into CSV format. Processes data as
# produced by the `josh_profile' script.
#
# Usage:
#     ./data_to_csv.pl [OPTIONS] input
# 
# Scripts options:
#     -a, --all-data
#         Outputs all iteration data. Without this flag, only the 
#         average for each data set (across all iterations) will be 
#         output.
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

use Getopt::Std;
use Getopt::Long;
use HTML::TableExtract;
use File::Util;
use File::Spec;

use constant USEFUL_HTML_FILE => "file0.html";
use constant OUTPUT_HEADER => "Profile,Data set,Iteration,Function Name,Calls,Total Time,Self Time\n";

require "./util.pl";

# Get command line options
Getopt::Long::Configure('bundling');
my $all_data;
GetOptions('a|all-data' => \$all_data);

# The argument should be the base directory for the profiling data
scalar(@ARGV) >= 1 || die("No directory specified!\n");
my $base_dir = $ARGV[0];
-d $base_dir || die("Directory doesn't exist: $base_dir\n");

# File::Util used to traverse directories
my $fu = File::Util->new;

# Get data sets from subdirectories below base directory
my @datasets = next_subdirectory_level($fu, $base_dir);

# Print header of output
print(OUTPUT_HEADER);

# A hashmap for the profiling results
#     results{'profile_name'}{'data_type'}
#
# Where 'data' is one of the following:
#     - calls               Total number of calls to each function, across all data sets.
#     - total_time          Total time for each function, across all data sets.
#     - self_time           Total self time for each function, across all data sets.
#     - iterations          Total iterations across all data sets.
#     - dataset_calls       Total number of calls to each function, across a given data set.
#     - dataset_total_time  Total time for each function, across a given data set.
#     - dataset_self_time   Total self time for each function, across a given data set.
#     - dataset_iterations  Total iterations across a given data set.
my %results = ();

# Loop through each data set
for my $dataset (@datasets) {
    my $dataset_string = strip_directory($dataset);
    
    # Get iterations from next subdirectory level
    my @iterations = next_subdirectory_level($fu, $dataset);
    
    # Loop through each iteration subdirectory
    for my $iteration (@iterations) {
        my $iteration_string = strip_directory($iteration);
    
        # Get profiles from next subdirectory level
        my @profiles = next_subdirectory_level($fu, $iteration);
        
        # Loop through each profile subdirectory
        for my $profile (@profiles) {
            my $profile_string = strip_directory($profile);
            
            # Check if the profile exists in the results hash
            if (!exists $results{$profile_string}) {
                $results{$profile_string} = ();
                $results{$profile_string}{'calls'} = ();
                $results{$profile_string}{'total_time'} = ();
                $results{$profile_string}{'self_time'} = ();
                $results{$profile_string}{'iterations'} = 0;
                $results{$profile_string}{'dataset_calls'} = ();
                $results{$profile_string}{'dataset_total_time'} = ();
                $results{$profile_string}{'dataset_self_time'} = ();
                $results{$profile_string}{'dataset_iterations'} = ();
            }
            if (!exists $results{$profile_string}{'dataset_calls'}{$dataset_string}) {
                $results{$profile_string}{'dataset_calls'}{$dataset_string} = ();
            }
            if (!exists $results{$profile_string}{'dataset_total_time'}{$dataset_string}) {
                $results{$profile_string}{'dataset_total_time'}{$dataset_string} = ();
            }
            if (!exists $results{$profile_string}{'dataset_self_time'}{$dataset_string}) {
                $results{$profile_string}{'dataset_self_time'}{$dataset_string} = ();
            }
            if (!exists $results{$profile_string}{'dataset_iterations'}{$dataset_string}) {
                $results{$profile_string}{'dataset_iterations'}{$dataset_string} = 0;
            }
    
            # Retrieve the input HTML file
            my $html_table_extract = HTML::TableExtract->new();
            my $useful_html_file = File::Spec->catfile($profile, USEFUL_HTML_FILE);
            $html_table_extract->parse_file($useful_html_file);

            # Buffered output
            my @output = ();

            # Loop through each table in the HTML file (note: should only be one)
            foreach my $table ($html_table_extract->tables()) {
                # We have seen another iteration
                ($results{$profile_string}{'dataset_iterations'}{$dataset_string})++;
                ($results{$profile_string}{'iterations'})++;
                
                # Get table rows
                my @data_rows = $table->rows();

                # Remove header information from data
                splice(@data_rows, 0, 1);

                # Output the data, looping through each row
                foreach my $row (@data_rows) {
                    my $function_name = @$row[0];
                    
                    my $calls = @$row[1];
                    $results{$profile_string}{'dataset_calls'}{$dataset_string}{$function_name} += $calls;
                    $results{$profile_string}{'calls'}{$function_name} += $calls;
                    
                    my $total_time = @$row[2];
                    $total_time =~ s/\s*s//;
                    $results{$profile_string}{'dataset_total_time'}{$dataset_string}{$function_name} += $total_time;
                    $results{$profile_string}{'total_time'}{$function_name} += $total_time;
                    
                    my $self_time = @$row[3];
                    $self_time =~ s/\s*s//;
                    $results{$profile_string}{'dataset_self_time'}{$dataset_string}{$function_name} += $self_time;
                    $results{$profile_string}{'self_time'}{$function_name} += $self_time;
                    
                    # Output the data
                    my $this_output = [$function_name, $calls, $total_time, $self_time];
                    push(@output, $this_output);
                }
            }
            
            # Output data for this iteration
            if ($all_data) {
                # Sort output on function name
                @output = sort {@$a[0] cmp @$b[0]} @output;
                
                foreach my $this_output (@output) {
                    my $function_name = @$this_output[0];
                    my $calls = @$this_output[1];
                    my $total_time = @$this_output[2];
                    my $self_time = @$this_output[3];
                    print("\"$profile_string\",\"$dataset_string\",\"$iteration_string\",\"$function_name\",$calls,$total_time,$self_time\n");
                }
            }
        }
    }
    
    # Output averages over this data set
    my @profiles = sort(keys(%results));
    foreach my $profile (@profiles) {
        my @functions = sort(keys(%{$results{"$profile"}{'dataset_calls'}{$dataset_string}}));
        
        foreach my $function (@functions) {
            my $calls_average = $results{$profile}{'dataset_calls'}{$dataset_string}{$function} / $results{$profile}{'dataset_iterations'}{$dataset_string};
            my $total_time_average = $results{$profile}{'dataset_total_time'}{$dataset_string}{$function} / $results{$profile}{'dataset_iterations'}{$dataset_string};
            my $self_time_average = $results{$profile}{'dataset_self_time'}{$dataset_string}{$function} / $results{$profile}{'dataset_iterations'}{$dataset_string};
            print("\"$profile\",\"$dataset_string\",\"average\",\"$function\",$calls_average,$total_time_average,$self_time_average\n");
        }
    }
}

# Output averages over all data sets
my @profiles = sort(keys(%results));
    foreach my $profile (@profiles) {
    
    my @functions = sort(keys(%{$results{$profile}{'calls'}}));
    foreach my $function (@functions) {
        my $calls_average = $results{$profile}{'calls'}{$function} / $results{$profile}{'iterations'};
        my $total_time_average = $results{$profile}{'total_time'}{$function} / $results{$profile}{'iterations'};
        my $self_time_average = $results{$profile}{'self_time'}{$function} / $results{$profile}{'iterations'};
        print("\"$profile\",\"average\",\"average\",\"$function\",$calls_average,$total_time_average,$self_time_average\n");
    }
}
