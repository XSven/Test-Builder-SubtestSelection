# NAME

Test::Builder::SubtestSelection - Select subtests by name or by number

# SYNOPSIS

```perl
# content of t/basic.t test script
use strict; use warnings;

# create test builder singleton instance first
use Test::Builder::SubtestSelection;

use Test::More tests => 2;

subtest 'this' => sub {
  # this group of related test function calls
};

subtest 'or that' => sub {
  # or that  group of related test function calls
};
```

# DESCRIPTION

The Modern Perl blog entries referred to in the ["SEE ALSO"](#see-also)) section
describe how usual Perl functions can be used to group related test function
calls inside a test script. By convention the name of each such a grouping
function should start with the `test_` prefix. If the groups of test function
calls are independent within the test script, which is anyway a good test
discipline, it should be possible to run them individually. The [Test::Named](https://metacpan.org/pod/Test%3A%3ANamed)
module supports this approach.

This class assumes that [Test::Builder](https://metacpan.org/pod/Test%3A%3ABuilder) subtests are used to group related
test function calls inside a test script. The class allows you to select
subtests by name or by number to run them. The name of a subtest is more like a
description. Any string is allowed and no special naming convention needs to be
followed. If possible each string is treated as a regular expression; otherwise
meta characters are properly quoted. The selection process itself applies to
top-level (not nested) subtests only!

```perl
# run all subtests
prove -v -b t/basic.t
# run "this"
prove -v -b t/basic.t :: --subtest 1
# run "or that"
prove -v -b t/basic.t :: --subtest 'or that'
```

# SEE ALSO

- [Organizing Perl Test Files](http://www.modernperlbooks.com/mt/2013/05/organizing-perl-test-files.html)
- [Running Named Perl Tests from Prove](http://www.modernperlbooks.com/mt/2013/05/running-named-perl-tests-from-prove.html)
- [Test::Named](https://metacpan.org/pod/Test%3A%3ANamed)

# AUTHOR

Sven Willenbuecher <sven.willenbuecher@gmx.de>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2023 by Sven Willenbuecher.

This is free software; you can redistribute it and/or modify it under the
same terms as the Perl 5 programming language system itself.

