#<<<
use strict; use warnings;
#>>>

on 'configure' => sub {
  requires 'Config'                        => '0';
  requires 'ExtUtils::MakeMaker::CPANfile' => '0';
};

on 'runtime' => sub {
  requires 'Class::Method::Modifiers' => '>= 2.00';
  requires 'Getopt::Long'             => '>= 2.24';
};

on 'test' => sub {
  requires 'Test::More' => '0';
};

on 'develop' => sub {
  suggests 'App::Software::License' => '0';
  suggests 'Pod::Markdown::Github'  => '0';
};
