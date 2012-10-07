use ExtUtils::MakeMaker;
require 5.006;

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile
   (
   'NAME'         => 'File::Util',
   'AUTHOR'       => 'Tommy Butler <cpan@atrixnet.com>',
   'ABSTRACT_FROM'=> 'Util.pod',
   'VERSION_FROM' => 'Util.pm',
   'INSTALLDIRS'  => 'site',
   'PREREQ_PM'    =>
      {
         'Class::OOorNO'      => 0.01_0,
         'Exception::Handler' => 1.00_0,
      },
   'linkext'      => { LINKTYPE => '' }, # no link needed
   'dist'         =>
      {
         'COMPRESS'  => 'gzip -9f',
         'SUFFIX'    => 'gz',
         'ZIP'       => '/usr/bin/zip',
         'ZIPFLAGS'  => '-rl',
      }
   );
