package CGI::Widget;

use strict;
use vars qw(@ISA @EXPORT_OK %EXPORT_TAGS $VERSION $AUTOLOAD);
require Exporter;
@ISA = 'Exporter';
use overload
 '""'     => \&asString,
 fallback => 1;

$VERSION = '0.12';
@EXPORT_OK   = qw(AUTOLOAD);
%EXPORT_TAGS = ( 'standard' => [qw(AUTOLOAD)] );

sub new {
  my $class = shift;
  my $self = bless {}, $class;
  $self->_init(@_);
  return $self;
}

sub AUTOLOAD {
  my ($pack,$func) = $AUTOLOAD =~ /(.+)::([^:]+)$/;

  $func =~ s/__/::/g;

  my $req = "CGI::Widget::$func";
  eval "require $req" || die "couldn't find $req : $!";
  return $req->new(@_);
}

sub DESTROY {}

sub _init {
  my $self = shift;
  return 1;
}

sub asString {
  my $self = shift;
  return $self;  #what did you expect from the base class?
}

1;
__END__
# Below is stub documentation for your module. You better edit it!

=head1 NAME

CGI::Widget - Base class for CGI::Widget::...

=head1 SYNOPSIS

  use CGI::Widget qw(:standard);
  #prints 1,2,3,4,
  print Series(-length=>4,-render=>sub{return shift.','});

=head1 DESCRIPTION

The CGI::Widget module's purpose is to allow authors of CGI or other 
dynamically generated HTML documents an easy way to create common, 
and possibly complex, page elements.

Widgets can be accessed either by explicitly creating Widget objects, as:

  use CGI::Widget::Series;
  my $series_widget = CGI::Widget::Series->new();
  print $series_widget,"\n";

or by using the CGI::Widget standard import tag, as:
  use CGI::Widget qw(:standard);
  print Series(),"\n";    #constructs CGI::Widget::Series
  print HList__Node,"\n"; #constructs CGI::Widget::HList::Node

Using ':standard' uses an AUTOLOAD subroutine that tries to construct
an object for you that resides under CGI::Widget.  For subclasses
of CGI::Widget subclasses and subclasses thereof, a double underscore
(__) must be given in place of the normal double colon (::) used to
delimit package names.  If someone knows a better way to do this, let
me know!

=head2 EXPORT

 :standard : AUTOLOAD for classes in the CGI::Widget namespace.

=head1 ACKNOWLEDGMENTS

 Thanks to Slaven Rezic for valuable ideas.

=head1 AUTHOR

 Allen Day E<allenday@ucla.edu>
 Copyright (c) 2001.

=head1 SEE ALSO

L<Perl>.
L<CGI::Widget::Series>

=cut
