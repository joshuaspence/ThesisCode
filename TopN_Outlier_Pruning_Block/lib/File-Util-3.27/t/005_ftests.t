
use strict;
use Test;

# use a BEGIN block so we print our plan before MyModule is loaded
BEGIN { plan tests => 35, todo => [] }
BEGIN { $| = 1 }

# load your module...
use lib './';
use File::Util qw( SL OS );

my($f) = File::Util->new();

my(@fls) = ( qq[t${\SL}txt], qq[t${\SL}bin], 't', '.', '..' );
my($skip) = (OS eq 'WINDOWS') ? 'Running on window$' : 0;

# types
ok(join('',@{[$f->file_type($fls[0])]}), 'PLAINTEXT');
ok(join('',@{[$f->file_type($fls[1])]}), 'PLAINBINARY');

# skip if windows
skip($skip, join('',@{[$f->file_type($fls[2])]}), 'BINARYDIRECTORY', $skip);
skip($skip, join('',@{[$f->file_type($fls[3])]}), 'BINARYDIRECTORY', $skip);
skip($skip, join('',@{[$f->file_type($fls[4])]}), 'BINARYDIRECTORY', $skip);

# chk these on windows
skip(!$skip, join('',@{[$f->file_type($fls[2])]}), 'DIRECTORY');
skip(!$skip, join('',@{[$f->file_type($fls[3])]}), 'DIRECTORY');
skip(!$skip, join('',@{[$f->file_type($fls[4])]}), 'DIRECTORY');


# file is/isn't binary
ok($f->isbin($fls[1], 1));
ok(!$f->isbin(__FILE__));

foreach (@fls) {

   my($file) = $_;

   # get file size
   ok($f->size($file), -s $file);

   # get file creation time
   ok($f->created($file),$^T - ((-M $file) * 60 * 60 * 24));

   # get file last access time
   ok($f->last_access($file),$^T - ((-A $file) * 60 * 60 * 24));

   # get file last modified time
   ok($f->last_modified($file),$^T - ((-M $file) * 60 * 60 * 24));

   # get file's bitmask
   ok($f->bitmask($file),sprintf('%04o',(stat($file))[2] & 0777));
}

exit;
