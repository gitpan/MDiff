package MDiff;

use strict;
use Carp;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $AUTOLOAD);

require Exporter;
require DynaLoader;
require AutoLoader;

@ISA = qw(Exporter DynaLoader);
@EXPORT = qw( is_mdiff );
$VERSION = '0.8';

sub AUTOLOAD {
    my $constname;
    ($constname = $AUTOLOAD) =~ s/.*:://;
    croak "& not defined" if $constname eq 'constant';
    my $val = constant($constname, @_ ? $_[0] : 0);
    if ($! != 0) {
	if ($! =~ /Invalid/) {
	    $AutoLoader::AUTOLOAD = $AUTOLOAD;
	    goto &AutoLoader::AUTOLOAD;
	} else { croak "Your vendor has not defined MDiff macro $constname"; }
    }
    no strict 'refs';
    *$AUTOLOAD = sub () { $val };
    goto &$AUTOLOAD;
}

bootstrap MDiff $VERSION;

1;

__END__
# Below is the stub of documentation for your module. You better edit it!

=head1 NAME

MDiff - Perl extension for m-differece detection.

=head1 SYNOPSIS

  use MDiff;

=head1 DESCRIPTION

m-difference is a comparason I designed myself--with the
help of the monks at http://www.perlmonks.org.  I'm sure
the idea has been around, but _I_ decided to call it
m-difference.  :)

Two strings are m-different if at least m of the characters
in the strings differ; that is, if m=3, then there are at
least 3 indicies (i, j, k) such that str1[i] != str2[i],
str1[j] != str2[j] and str1[k] != str2[k].

=head1 Exported function

  is_mdiff($m, $str1, $str2);

=head1 AUTHOR

Jettero Heller <jettero@voltar.org>

=head1 SEE ALSO

perl(1).

=cut
