package Web::Access::Control::AccessPlan;

use Moo::Role;


around 'access_plans' => sub {
  my $orig = shift;
  my @params = @_;
  my $self        = shift;
  my $model = shift;
  my $active_graphs       = shift;
  my $pattern     = shift;
  
  my @checkedplans;
  my @plans = $orig->(@params);
  foreach my $plan (@plans) {
	 if ($plan->isa('Attean::Plan::Quad')) {
		if ($wac->checkAccess($plan->graph)) {
		  push(@checkedplans, $plan);
		} else {
		  push(@checkedplans, Web::Access::Control::Plan::RestrictedQuad->new);
		}
	 } else {
		warn "not a quad, weird?";
	 }
	 return @checkedplans;
  }
}
		  
