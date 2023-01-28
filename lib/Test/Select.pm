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

my $subtest;
GetOptions( 's|subtest=s' => \$subtest );    # parses the command line from @ARGV

sub import { shift->new; }

sub subtest {
  my ( $self, $name ) = @_;

  my $current_test = $self->current_test + 1;
  if ( defined $subtest and ( $subtest =~ /\A \d+ \z/x ? $current_test != $subtest : $name !~ m/$subtest/ ) ) {
    $self->skip( 'triggered by ' . __PACKAGE__, $name );
  } else {
    goto ref( $self )->can( 'SUPER::subtest' );
  }
}

1;
