package CGI::Widget;

use strict;
use vars qw($VERSION);
use overload
 '""'     => \&asString,
 fallback => 1;

$VERSION = '0.05';

sub new {
  my $class = shift;
  my $self = bless {}, $class;
  $self->_init(@_);
  return $self;
}

sub _init {
  my $self = shift;
  return 1;
}

sub asString {
  my $self = shift;
  return $self;  #what do you expect from the base class?
}

1;
__END__
# Below is stub documentation for your module. You better edit it!

=head1 NAME

CGI::Widget - Base class for CGI::Widget::...

=head1 SYNOPSIS

  use CGI::Widget;
  blah blah blah

=head1 DESCRIPTION

You probably don't want to create a new CGI::Widget object, unless
you're subclassing.  This is just a base class.

=head2 EXPORT

None by default.

=head1 AUTHOR

 Allen Day E<allenday@ucla.edu>
 Copyright (c) 2001.

=head1 SEE ALSO

L<Perl>.
L<CGI::Widget::Series>

=cut
