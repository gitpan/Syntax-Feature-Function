
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Provides a function keyword',
  'AUTHOR' => 'Robert \'phaylon\' Sedlacek <rs@474.at>',
  'BUILD_REQUIRES' => {},
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Syntax-Feature-Function',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Syntax::Feature::Function',
  'PREREQ_PM' => {
    'B::Hooks::EndOfScope' => '0.08',
    'Carp' => '0',
    'Function::Parameters' => '0.04',
    'Test::More' => '0.94',
    'namespace::clean' => '0.14',
    'syntax' => '0'
  },
  'VERSION' => '0.001',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



