#!/usr/bin/perl

################################################################################
#
# Script to output unique values from a specified column of a CSV file. The CSV
# file is read from STDIN.
#
# Usage:
#     ./unique_from_csv.pl column_number
#
# Input:  The column index of the column to output.
# Output: Unique column values. Outputs to STDOUT.
#
################################################################################

use strict;
use warnings;

use Text::CSV;
use List::MoreUtils qw/ uniq /;

# Check command line arguments
my $num_args = $#ARGV + 1;
$num_args == 1 || die("No column index specified");

my $column = $ARGV[0];
$column =~ m/^(\d+)$/ || die("Column index must be an integer");

my $csv = Text::CSV->new();
my @values = ();
my $in_header = 1;
while (<STDIN>) {
    # Skip header row
    if ($in_header) {
        $in_header = 0;
        next;
    }
    
    # Parse CSV
    if ($csv->parse($_)) {
        my @columns = $csv->fields();
        push(@values, $columns[$column]);
    } else {
        my $err = $csv->error_input;
        die("Failed to parse line: $err");
    }
}

# Output unique values
my @unique = uniq @values;
foreach (@unique) {
    print "$_\n";
}
