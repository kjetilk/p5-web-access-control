with 'Attean::API::Store', 'Attean::API::CostPlanner';

sub cost_for_plan {
  my $self = shift;
  my $plan = shift;
  my $planner = shift;
  
  if ($plan->isa('Web::Access::Control::Plan::RestrictedQuad')) {
	 return Inf;
  }
  return;
}
