
use strict;
use Test;

# use a BEGIN block so we print our plan before MyModule is loaded
BEGIN { plan tests => 46, todo => [] }
BEGIN { $| = 1 }

# load your module...
use lib './';
use File::Util qw
   (
      SL   NL   escape_filename
      valid_filename   strip_path   needs_binmode
   );

my($f) = File::Util->new();

# check asignability
my($NL) = NL; my($SL) = SL;

# newlines
ok(NL eq $NL);                                                         # test 1

# binmode necessary?
ok(needs_binmode, NL eq qq[\015\012] ? 1 : 0);                         # test 2

# path seperator
ok(SL eq $SL);                                                         # test 3

# test file escaping with substitute escape char
# with additional char to escape as well.
ok                                                                     # test 4
   (
      escape_filename(q[./foo/bar/baz.t/], '+','.'),
      '++foo+bar+baz+t+'
   );

# test file escaping with defaults
ok                                                                     # test 5
   (
      escape_filename(q[.\foo\bar\baz.t]),
      '._foo_bar_baz.t'
   );

# test file escaping with option "--strip-path"
ok                                                                     # test 6
   (
      escape_filename
         (
            q[.:foo:bar:baz.t],
            '--strip-path'
         ),
      'baz.t'
   );

# path stripping in general
ok(strip_path(__FILE__),'004_portable.t');                               # test 7

# illegal filename character intolerance
ok(!valid_filename(qq[?foo]));      # question mark
ok(!valid_filename(qq[>foo]));      # greater than
ok(!valid_filename(qq[<foo]));      # less than
ok(!valid_filename(qq[<foo]));      # less than
ok(!valid_filename(qq[<foo]));      # less than
ok(!valid_filename(qq[<foo]));      # less than
ok(!valid_filename(qq[:foo]));      # colon
ok(!valid_filename(qq[*foo]));      # asterisk
ok(!valid_filename(qq[/foo]));      # forward slash
ok(!valid_filename(qq[\\foo]));     # back slash
ok(!valid_filename(qq["foo]));      # double quotation mark
ok(!valid_filename(qq[\tfoo]));     # tab
ok(!valid_filename(qq[\013foo]));   # vertical tab
ok(!valid_filename(qq[\012foo]));   # newline
ok(!valid_filename(qq[\015foo]));   # form feed

# strange but legal filename character tolerance
ok(valid_filename(q['foo]));
ok(valid_filename(';foo'));
ok(valid_filename('$foo'));
ok(valid_filename('%foo'));
ok(valid_filename('`foo'));
ok(valid_filename('!foo'));
ok(valid_filename('@foo'));
ok(valid_filename('#foo'));
ok(valid_filename('^foo'));
ok(valid_filename('&foo'));
ok(valid_filename('-foo'));
ok(valid_filename('_foo'));
ok(valid_filename('+foo'));
ok(valid_filename('=foo'));
ok(valid_filename('(foo'));
ok(valid_filename(')foo'));
ok(valid_filename('{foo'));
ok(valid_filename('}foo'));
ok(valid_filename('[foo'));
ok(valid_filename(']foo'));
ok(valid_filename('~foo'));
ok(valid_filename('.foo'));
ok(valid_filename(q/;$%`!@#^&-_+=(){}[]~baz.foo'/));

# directory listing tests...
# remove '.' and '..' directory entries
ok(length(join('',$f->_dropdots(qw(. .. foo bar baz)))),9);

exit;
