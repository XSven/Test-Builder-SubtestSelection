#<<<
use strict; use warnings;
#>>>

on 'configure' => sub {
  requires 'Config'                        => '0';
  requires 'ExtUtils::MakeMaker::CPANfile' => '0';
};

on 'runtime' => sub {
  requires 'Getopt::Long' => '>= 2.24';
  requires 'Test::More'   => '>= 0.99';
};

on 'develop' => sub {
  suggests 'App::Software::License' => '0';
  suggests 'Pod::Markdown::Github'  => '0';
};
