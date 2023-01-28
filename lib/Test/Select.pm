#<<<
use strict; use warnings;
#>>>

package Test::Select;

our $VERSION = '0.001';

BEGIN {
  require parent;
  local $ENV{ TB_NO_EARLY_INIT } = 1;
  parent->import( qw( Test::Builder ) );
}
use Getopt::Long qw( GetOptions :config posix_default );

my @subtest_selection;
# parse @ARGV
GetOptions( 's|subtest=s' => \@subtest_selection );

sub import { shift->new; }

# override Test::Builder::subtest()
sub subtest {
  my ( $self, $name ) = @_;

  my $class        = ref $self;
  my $current_test = $self->current_test + 1;
  if ( not @subtest_selection
    or grep { m/\A [1-9]\d* \z/x ? $current_test == $_ : $name =~ m/ $_ /x } @subtest_selection )
  {
    goto $class->can( 'SUPER::subtest' );
  } else {
    $self->skip( "triggered by $class", $name );
  }
}

1;
