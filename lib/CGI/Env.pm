package CGI::Env;

use base qw(Exporter);

our @EXPORT_OK = qw($cgi $mod_perl $mod_perl1 $mod_perl2 $perlex);

our $VERSION = '0.01';

our $cgi       = 0;
our $mod_perl  = 0;
our $mod_perl1 = 0;
our $mod_perl2 = 0;
our $perlex    = 0;

$cgi++ if defined $ENV{'GATEWAY_INTERFACE'};
$perlex++ if defined $ENV{'GATEWAY_INTERFACE'}
	&& $ENV{'GATEWAY_INTERFACE'} =~ /^CGI-PerlEx/;
if (defined $ENV{MOD_PERL} && !$perlex) {
	$mod_perl++;
	if (defined $ENV{MOD_PERL_API_VERSION} && $ENV{MOD_PERL_API_VERSION} == 2) {
		$mod_perl2++;
	}
	else {
		$mod_perl1++;
	}
}

1; # return true value

__END__

=head1 NAME

CGI::Env - Detect CGI, mod_perl and PerlEx.

=head1 SYNOPSIS

  use CGI::Env;

  print 'I am using PerlEx' if $CGI::Env::perlex;

  or

  use CGI::Env qw($perlex);

  print 'I am using PerlEx' if $perlex;

=head1 DESCRIPTION

CGI::Env detecs CGI, mod_perl and PerlEx.

=head1 EXPORTABLE VARIABLES

  $cgi       - Is script executed through CGI?
  $mod_perl  - Is script executed through mod_perl?
  $mod_perl1 - Is script executed through mod_perl 1.x?
  $mod_perl2 - Is script executed through mod_perl 2.x?
  $perlex    - Is script executed through PerlEx?

=head1 KNOWN ISSUES

C<$cgi> is set to 1 even if script is executed through mod_perl, PerlEx or
 FastCGI. Use this variable to detect is script executed by web server.

=head1 AUTHOR

Tomasz Konojacki (xenu536@hotmail.com).

=head1 COPYRIGHT

Copyright (c) 2011 Tomasz Konojacki. All rights reserved.
This program is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.

The full text of the license can be found in the LICENSE file included with this
module.

=cut