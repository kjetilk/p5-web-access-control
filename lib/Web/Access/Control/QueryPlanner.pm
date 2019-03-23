package Web::Access::Control::QueryPlanner;

use Moo;
extends 'Attean::QueryPlanner';
with 'Web::Access::Control::AccessPlan';

sub cost_for_plan {
  my $self = shift;
  my $plan = shift;
  my $planner = shift;
  
  if ($plan->isa('Web::Access::Control::Plan::RestrictedQuad')) {
	 return Inf;
  }
  return;
}

1;
