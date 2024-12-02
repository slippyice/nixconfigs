#!/usr/bin/env perl
use Modern::Perl;

my $copyPath = "~/Flakes/";
my $pastePath = "~/FlakesGit/";

foreach (`eza --oneline $copyPath`) {
	chomp;
	`cp $copyPath$_ $pastePath$_`;
}
