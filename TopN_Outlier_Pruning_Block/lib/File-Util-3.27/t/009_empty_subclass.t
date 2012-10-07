
use strict;
use Test;

# use a BEGIN block so we print our plan before module is loaded
BEGIN { use File::Util }
BEGIN { plan tests => scalar(@File::Util::EXPORT_OK), todo => [] }
BEGIN { $| = 1 }

# load your module...
use lib './';

# automated empty subclass test

# subclass File::Util in package _Foo
package _Foo;
use strict;
use warnings;
use File::Util qw( :all );
$Foo::VERSION = 0.00_0;
@_Foo::ISA = qw( File::Util );
1;

# switch back to main package
package main;

# see if _Foo can do everything that File::Util can do
map {

   ok ref(UNIVERSAL::can('_Foo', $_)) eq 'CODE'

} @File::Util::EXPORT_OK;


exit;
