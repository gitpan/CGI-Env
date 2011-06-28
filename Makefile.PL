

use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME         => 'CGI::Env',
    VERSION_FROM => 'lib/CGI/Env.pm', # finds \$VERSION
    AUTHOR       => 'Tomasz Konojacki (xenu536@hotmail.com)',
    ABSTRACT     => 'Module abstract (<= 44 characters) goes here',
    PREREQ_PM    => {
                     'Test::Simple' => 0.44,
                    },
);
