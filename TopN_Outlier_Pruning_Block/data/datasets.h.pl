#!/usr/bin/perl

use strict;
use warnings;

use File::Basename;
use File::Util;

#===============================================================================
# Configuration
#===============================================================================
use constant DATASET_DIR => '../data';
#-------------------------------------------------------------------------------

sub get_dataset_path($) {
    my $dataset_path = $_[0];
    if ($dataset_path =~ m!^${\(dirname($0))}/../(data/.*)$!) {
        return $1;
    } else {
        return $dataset_path;
    }
}

sub get_dataset_name($) {
    my $dataset_path = $_[0];
    if ($dataset_path =~ m/^(.*\/)?([^\/]+)\.dat$/) {
        return $2;
    } else {
        return $dataset_path;
    }
}

# Make sure an output file was specified
scalar(@ARGV) >= 1 || die('No output file specified');
my $output_file = $ARGV[0];
open(OUTPUT, ">$output_file") || die("Cannot open output file: $output_file");

# Get the data sets.
-d "${\(dirname($0))}/${\DATASET_DIR}" || die("Directory doesn't exist: $${\(dirname($0))}/${\DATASET_DIR}");
my $fu = File::Util->new;
my @dataset_files = $fu->list_dir("${\(dirname($0))}/${\DATASET_DIR}", '--files-only', '--no-fsdots', '--pattern=\.dat$', '--with-paths', '--recurse');

print OUTPUT <<EOF;
#ifndef DATASETS_H_
#define DATASETS_H_

#include <string.h> /* for strcmp */

/*============================================================================*/
/* The data sets                                                              */
/*============================================================================*/
EOF

# Loop through each data set
my @datasets = ();
for my $dataset_file (@dataset_files) {
    my $dataset_name = get_dataset_name($dataset_file);
    push(@datasets, $dataset_name);
    print OUTPUT "#include \"${\(get_dataset_path($dataset_file))}.h\"\n";
}
print OUTPUT "/*----------------------------------------------------------------------------*/\n\n";

print OUTPUT "static int test_embedded_dataset(const char * const dataset) {\n";
for my $dataset (@datasets) {
    print OUTPUT <<EOF;
    if (strcmp(dataset, "$dataset") == 0) {
        return test(dataset_${dataset}, dataset_${dataset}_size);
    }
EOF
}

print OUTPUT <<EOF;
    PRINTF_STDERR("Data set not found: %s\\n", dataset);
    return -1;
}
EOF

print OUTPUT <<EOF;
#endif /* #ifndef DATASETS_H_ */
EOF
close(OUTPUT);
