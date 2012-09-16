#!/usr/bin/perl

################################################################################
#
# Script to convert a vertical CSV file into a horizontal CSV file. See
# http://stackoverflow.com/questions/2247851/how-to-convert-a-csv-list-horizontal-from-vertical-name-value-pair-set
#
# Usage:
#     ./vertical_to_horizontal.pl [OPTIONS] input
# Scripts options:
#     NONE    No options.
#
# Input:      Base directory where the profiler output is found. Should contain 
#             subdirectories named after the data sets that the data pertains 
#             to. Each data set subdirectory should contain a single 
#             subdirectory for each iteration of the Matlab code.
# Output:     Profiler data in CSV format
#
################################################################################

use strict;
use warnings;

use Set::Scalar;

use FindBin;
use lib $FindBin::Bin;
require 'util.pl';

# The argument should be the input file
scalar(@ARGV) >= 1 || die('No file specified!');
open FILE, "<$ARGV[0]" or die $!;

# A set containing all data sets
my $columns = new Set::Scalar->new;

# A hashmap for the profiling results
#     functions{'function_name'}{'profile'}{'data_set'}{'iteration'}{'data'}
#
# Where 'data' is one of the following:
#     - calls               Total number of calls to each function, across all data sets.
#     - total_time          Total time for each function, across all data sets.
#     - self_time           Total self time for each function, across all data sets.
my %functions = ();

# Parse the data
for my $line (<FILE>) {
    # Skip the first line (which is a header)
    next if 1 .. 1;
    
    # Extract data from this line
    chomp($line); # remove newline characters
    my $profile = csv_parse_profile($line);
    my $dataset = csv_parse_dataset($line);
    my $function = csv_parse_function($line);
    my $self_time = csv_parse_self_time($line);
    my $total_time = csv_parse_total_time($line);
    my $calls = csv_parse_calls($line);
    
    # Add data set to list
    my $column = ();
    $column{'profile'} = $profile;
    $column{'dataset'} = $dataset;
    $column{'iteration'} = $iteration;
    $columns->insert($column);
    
    # Create a new subhash if it doesn't yet exist
    if (!exists $functions{$function}) {
        $functions{$function} = ();
    }
    if (!exists $functions{$function}{$profile}) {
        $functions{$function}{$profile} = ();
    }
    if (!exists $functions{$function}{$dataset}) {
        $functions{$function}{$profile}{$dataset} = ();
    }
    if (!exists $functions{$function}{$dataset}{$iteration}) {
        $functions{$function}{$profile}{$dataset}{$iteration} = ()
        $functions{$function}{$profile}{$dataset}{$iteration}{'calls'} = $calls;
        $functions{$function}{$profile}{$dataset}{$iteration}{'total_time'} = $total_time;
        $functions{$function}{$profile}{$dataset}{$iteration}{'self_time'} = $self_time;
    }
}

# Close the file
close(FILE);

# Print the header
my $profile_header_row   = 'Function';
my $dataset_header_row   = 'Function';
my $iteration_header_row = 'Function';
foreach my $dataset (sort $datasets->elements) {
    print(",\"$dataset\"");
}
print("\n");

# Print the data
foreach my $function (sort keys %functions) {
    print("\"$function\"");

    my %function_hash = %{$functions{$function}};
    foreach my $dataset (sort $datasets->elements) {
        if (exists($function_hash{$dataset})) {
            my $data = $function_hash{$dataset};
            print(",$data");
        } else {
            # If this dataset didn't use this function, print 0.
            print(',0');
        }
    }
    print("\n");
}
