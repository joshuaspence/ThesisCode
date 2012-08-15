#!/usr/bin/perl

################################################################################
#
# A utility file with various common functions.
#
################################################################################

use File::Util;
use HTML::TableExtract;

my $fu = File::Util->new;
my $html_table_extract = HTML::TableExtract->new();

#===============================================================================
# Retrieve the name of the most nested subdirectory from a directory path.
#
# Usage:
#     strip_directory($path)
#===============================================================================
sub strip_directory($) {
    my $formatted_string = $_[0];
    $formatted_string =~ s/.*\///g;
    return $formatted_string;
}

#===============================================================================
# Parse a function's name from a HTML table row (from the MATLAB profile HTML
# output).
#
# Usage:
#     parse_function_name($table_row)
#===============================================================================
sub parse_function_name($) {
    my $row = $_[0];
    return @$row[0];
}

#===============================================================================
# Parse a function's calls from a HTML table row (from the MATLAB profile HTML
# output).
#
# Usage:
#     parse_function_calls($table_row)
#===============================================================================
sub parse_function_calls($) {
    my $row = $_[0];
    return @$row[1];
}

#===============================================================================
# Parse a function's total time from a HTML table row (from the MATLAB profile
# HTML output).
#
# Usage:
#     parse_function_total_time($table_row)
#===============================================================================
sub parse_function_total_time($) {
    my $row = $_[0];
    (my $time = @$row[2]) =~ s/\s*s//;
    return $time;
}

#===============================================================================
# Parse a function's self time from a HTML table row (from the MATLAB profile
# HTML output).
#
# Usage:
#     parse_function_self_time($table_row)
#===============================================================================
sub parse_function_self_time($) {
    my $row = $_[0];
    (my $time = @$row[3]) =~ s/\s*s//;
    return $time;
}

#===============================================================================
# Parse the block size from a profiling directory name.
#
# Usage:
#     parse_block_size($directory_name)
#===============================================================================
sub parse_block_size($) {
    my $dir_name = $_[0];
    if ($dir_name =~ m/no-blocking/) {
        return 0;
    } else {
        $dir_name =~ /block_size-([0-9]+)/;
        return $1;
    }
}

#===============================================================================
# Retrieve all subdirectories below the input directory.
#
# Usage:
#     next_subdirectory_level($directory)
#===============================================================================
sub next_subdirectory_level($) {
    return $fu->list_dir($_[0], '--dirs-only', '--no-fsdots', '--with-paths');
}

#===============================================================================
# Take the logarithm of a number in base-10.
#
# Usage:
#     log10($number)
#===============================================================================
sub log10($) {
    if ($_[0] == 0) {
        return -1;
    } else {
        return log($_[0]) / log(10);
    }
}

#===============================================================================
# Retrieve an array containing the rows from a HTML table.
#
# Usage:
#     get_table_rows($path)
#===============================================================================
sub get_table_rows($) {
    # Retrieve the input HTML file
    $html_table_extract->parse_file($_[0]);
    
    # Get table rows (there should only be one table)
    my $table = ($html_table_extract->tables())[0];
    my @data_rows = $table->rows();

    # Remove header information from data
    splice(@data_rows, 0, 1);

    return @data_rows;
}

# Necessary to "require" this file from other perl scripts.
1;
