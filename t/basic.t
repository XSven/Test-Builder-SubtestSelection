#<<<
use strict; use warnings;
#>>>

use Test::Select qw();
use Test::More import => [ qw( pass plan subtest ) ], tests => 2;

subtest 'first' => sub {
  plan tests => 2;
  pass( 'first 1' );
  pass( 'first 2' );
};

subtest 'second' => sub {
  plan tests => 2;
  pass( 'second 1' );
  pass( 'second 2' );
};
