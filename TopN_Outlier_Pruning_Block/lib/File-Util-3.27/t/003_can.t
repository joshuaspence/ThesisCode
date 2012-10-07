
use strict;
use Test;

# use a BEGIN block so we print our plan before MyModule is loaded
BEGIN { plan tests => 37, todo => [] }
BEGIN { $| = 1 }

# load your module...
use lib './';
use File::Util;

my($f) = File::Util->new();

# check to see if non-autoloaded File::Util methods are can-able ;O)
map { ok(ref(UNIVERSAL::can($f,$_)),'CODE') } qw
   (
      _dropdots
      _errors
      _release
      _seize
      _throw
      bitmask
      can_flock
      can_read
      can_write
      created
      ebcdic
      escape_filename
      existent
      file_type
      isbin
      last_access
      last_modified
      line_count
      list_dir
      load_dir
      load_file
      flock_rules
      make_dir
      max_dives
      needs_binmode
      new
      open_handle
      readlimit
      size
      strip_path
      trunc
      use_flock
      write_file
      valid_filename
      VERSION
      DESTROY
      AUTOLOAD
   );

exit;
