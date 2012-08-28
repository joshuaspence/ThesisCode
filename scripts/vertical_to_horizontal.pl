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
use Text::CSV;

use FindBin;
use lib $FindBin::Bin;
require "util.pl";

# The argument should be the input file
scalar(@ARGV) >= 1 || die("No file specified!\n");
open FILE, "<", $ARGV[0] or die $!;
my $csv = Text::CSV->new();

# A hash of hashes, hashing a function name to a hash containing each dataset,
# mapping to the self-time of this function for that dataset
my %functions = ();

# A set containing all data sets
my $datasets = new Set::Scalar->new;

# Parse the data
while(<FILE>) {
    # Skip the first line (which is a header)
    next if 1 .. 1;

    # Extract data from this line
    chomp; # remove newline characters
    my @fields;
    if ($csv->parse($_)) {
        @fields = $csv->fields();
    } else {
        my $err = $csv->error_input;
        die("Failed to parse line: $err");
    }
    my $dataset = $fields[0];
    my $function = $fields[2];
    my $self_time = $fields[5];

    # Add data set to list
    $datasets->insert($dataset);

    # Create a new subhash if it doesn't yet exist
    if (!exists($functions{$function})) {
        %{$functions{$function}} = ();
    }
    
    # Add this function to the hash of hashes
    $functions{$function}{$dataset} = $self_time;
}

# Close the file
close(FILE);

# Print the header
print("\"Function\"");
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
            print(",0");
        }
    }
    print("\n");
}
