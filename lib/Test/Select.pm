#<<<
use strict; use warnings;
#>>>

package Test::Select;

our $VERSION = '0.001';

use Class::Method::Modifiers qw( install_modifier );
use Getopt::Long             qw( GetOptions :config posix_default );
use Test::Builder            qw();

my $subtest;
GetOptions( 's|subtest=s' => \$subtest ); # parses the command line from @ARGV

install_modifier 'Test::Builder', 'around', 'subtest', sub {
  my $orig = shift;
  my ( $self, $name ) = @_;

  my $current_test = $self->current_test + 1;
  if ( $subtest =~ /\A \d+ \z/x ? $current_test != $subtest : $name !~ m/$subtest/ ) {
    $self->skip( 'not selected', $name );
  } else {
    goto $orig;
  }
} if defined $subtest;

1;
