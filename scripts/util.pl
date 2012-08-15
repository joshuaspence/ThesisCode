#!/usr/bin/perl

################################################################################
#
# A utility file with various common functions.
#
################################################################################

sub strip_directory($) {
    my $formatted_string = $_[0];
    $formatted_string =~ s/.*\///g;
    return $formatted_string;
}

sub parse_function_name($) {
    my $row = $_[0];
    return @$row[0];
}

sub parse_function_time($) {
    my $row = $_[0];
    (my $time = @$row[2]) =~ s/\s*s//;
    return $time;
}

sub parse_block_size($) {
    my $dir_name = $_[0];
    if ($dir_name =~ m/no-blocking/) {
        return 0;
    } else {
        $dir_name =~ /block_size-([0-9]+)/;
        return $1;
    }
}

sub next_subdirectory_level($$) {
    return $_[0]->list_dir($_[1], '--dirs-only', '--no-fsdots', '--with-paths');
}

sub log10($) {
    if ($_[0] == 0) {
        return -1;
    } else {
        return log($_[0]) / log(10);
    }
}

1;
