package Web::Access::Control::Plan::RestrictedQuad;

use warnings;
use strict;
use Moo;

extends 'Attean::Plan::Quad';

around 'plan_as_string' => sub {
  my ($orig, $self, @rest) = @_;
  return 'Restricted' . $self->$orig(@rest);
};

sub impl {
  die "A RestrictedQuad Plan cannot be evaluated, it restricts the access to a quad";
}
	 

1;
