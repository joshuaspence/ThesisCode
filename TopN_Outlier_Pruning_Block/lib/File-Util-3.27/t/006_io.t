
use strict;
use Test;

# use a BEGIN block so we print our plan before File::Util is loaded
BEGIN { plan tests => 13, todo => [] }
BEGIN { $| = 1 }

# load your module...
use lib './';
use File::Util qw( SL NL existent );

my($f)    = File::Util->new('--fatals-as-status');
my($fh)   = undef;
my($testbed) = 't' . SL . $$;
my($skip) = !$f->can_write('.') ||
            !$f->can_write('t');

$skip = $skip ? &skipmsg() : $skip;

sub skipmsg { <<'__WHYSKIP__' }
Insufficient permissions to perform IO in this directory.  Can't perform tests!
__WHYSKIP__

# 1
# make a temporary testbed directory
skip($skip, sub { $f->make_dir($testbed, '--if-not-exists') }, $testbed);

# 2
# see if it's there
skip($skip, -e $testbed, 1, $skip);

# 3
# ...again
skip($skip, sub { $f->existent($testbed) }, 1, $skip);

# 4
# make a temporary file
my($tmpf) = $testbed . SL . 'tmptst';
skip(
	$skip,
	sub {
		$f->write_file('file' => $tmpf, 'content' => $$ . NL),
	}, 1, $skip
);

# 5
# File::Util::touch() a file, and see if it was created ok
skip(
	$skip,
	sub {
        my($tmpf) = $testbed . SL . 'touched';
		$f->touch($tmpf);
        my($return) = $f->existent($tmpf);
        unlink($tmpf);
        return($return);
	}, 1, $skip
);

# 6
# get an open file handle
$fh = '';
skip(
	$skip,
	sub {
      $fh = $f->open_handle(
         'file' => $tmpf,
         'mode' => 'append',
         qw(--fatals-as-errmsg --warn-also)
      );
      $skip = &skipmsg() unless ($fh && length($fh) > 1);
      return 1; # stupid solaris testers won't play fair
   },
   1,
   $skip
);

# 7
# make sure it's still open
skip($skip, eval(q{fileno($fh)}), '/^\d/', $skip);

# write to it, close it, write to it in append mode
unless ($skip) { print( $fh 'Hello world!' . NL ); close($fh); }

# 8
# load file
skip($skip, sub { $f->load_file($tmpf),$f->load_file($tmpf) });

# 9
# write to it with method File::Util::write_file(), compare file contents
# with the returned value
skip (
	$skip,
	sub {
		$f->write_file(
			'filename' => $tmpf,
			'content'  => ( $^O || 'foo' ) . NL,
			'mode'     => 'append',
		)
	}, 1, $skip
);

# 10
# get line count of file
skip($skip, sub { $f->line_count($tmpf) }, 3, $skip);

# 11
# truncate file
skip($skip, sub { $f->trunc($tmpf); -s $tmpf }, 0, $skip);

# 12
# get line count of file
skip($skip, sub { $f->line_count($tmpf)}, 0, $skip);

# big directory creation / removal sequence
my($newdir) =
  $testbed
  . SL . int(rand(time))
  . SL . int(rand(time))
  . SL . int(rand(time))
  . SL . int(rand(time));

# 13
# make directories
skip($skip, sub { $f->make_dir($newdir, '--if-not-exists') }, $newdir, $skip);

# read directories
unless ($skip) {
	my(@items) = $f->list_dir($testbed, '--follow');

	# remove directories, temp file, testbed.
	foreach (reverse(sort({ length($a) <=> length($b) } @items)), $testbed) {

		-d $_ ? rmdir($_) || &_rmdie($!) : unlink($_) || &_uldie($!);
	}
}

exit;

# ---- SUBS -----------------------------------------------

sub _uldie { die(<<__BADUNLINK__) }
Can't unlink recently created temp file used in testing process.
$!
__BADUNLINK__

sub _rmdie { die(<<__BADRMDIR__) }
Can't remove recently created temporary directory used in testing process.
$!
__BADRMDIR__
