
use strict;
use Test;

# use a BEGIN block so we print our plan before MyModule is loaded
BEGIN { plan tests => 12, todo => [] }
BEGIN { $| = 1 }

# load your module...
use lib './';
use Fcntl qw( );

use File::Util qw( SL NL );
my($f) = File::Util->new();
my($tmpf) = 'flock_test';
my($probe_flock) = sub { local($@); eval(<<'__canflock__'); $@ ? 0 : 1 };
flock(STDIN, &Fcntl::LOCK_SH);
flock(STDIN, &Fcntl::LOCK_UN);
__canflock__
my($skip) = !$f->can_write('.') || !$f->can_write('t');

$skip = $skip ? &skipmsg() : $skip;

# using flock? get/set flock-ing usage toggle
ok($f->use_flock( ),1);                                                # test 1
ok($f->use_flock(1),1);                                                # test 2
ok($f->use_flock(0),0);                                                # test 3
ok($f->use_flock( ),0);                                                # test 4
ok($f->use_flock(1),1);                                                # test 5

# get/set flock-ing failure policy
ok(qq[@{[$f->flock_rules()]}],'NOBLOCKEX FAIL');                       # test 6
ok(join(' ', $f->flock_rules(qw/ NOBLOCKEX ZERO /)),q[NOBLOCKEX ZERO]);# test 7

# can the system lock file IO?  does it?
skip(!$probe_flock, $f->can_flock, 1);                                 # test 8

# does it really work?
skip(!$probe_flock, &test_flock());                                    # test 9

exit;

# put flock to the "test"
sub test_flock {

   # lock file, keep open handle on it
   my($fh);

	unless ($skip) {
		$fh = $f->open_handle('file' => $tmpf);

		# write something into the file
		my($tstr) = 'Hello world!' . NL;
		print($fh $tstr x 50);

	}

   # try to $f->trunc locked file (should fail)
   skip(
		$skip,
		sub { # test 10

			# FORKING!!
			my($pid) = fork; $| = 1; die(qq{Can't fork: $!}) unless defined($pid);

			if (!$pid) { $f->trunc($tmpf); exit } else { waitpid($pid, 0) }

			# DONE WITH THAT NOW.
			-s $tmpf
	});

   # test 11 - try to $f->write_file on locked file (should fail)
   skip(
		$skip,
		sub {

			# FORKING!!
			my($pid) = fork; $| = 1; die(qq{Can't fork: $!}) unless defined($pid);

			if (!$pid) {

				$f->write_file(
					'file' => $tmpf,
					'content' => '',
					'--empty-writes-OK'
				);

				exit
			}
			else { waitpid($pid, 0) }

			# DONE WITH THAT NOW.
			-s $tmpf
	});

   # unlock file
   close($fh) unless $skip;

   # test 12 - try to trunc the file; should succeed
   #  - skip this on solaris...
   if ($^O =~ /solaris/i) {
      skip(&skip_trunc_solaris(), 0, 0);
   }
   else {
      skip($skip, sub { $f->trunc($tmpf); return -s $tmpf }, 0);
   }

   # try to delete the file; should succeed
   unlink($tmpf) unless $skip;

   !-e $tmpf;
}

sub skipmsg { <<'__WHYSKIP__' }
Insufficient permissions to perform IO in this directory.  Can't perform tests!
__WHYSKIP__

sub skip_trunc_solaris { <<'__WHYSKIP__' }
Solaris can flock, but won't let go of discretionary lock yet.
__WHYSKIP__

