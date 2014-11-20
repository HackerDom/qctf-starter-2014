#! /usr/bin/perl

use strict;
use warnings;

$/ = undef;
$" = undef;

my $flagFile = shift;

my @samples;
for (@ARGV) {
	open IN, "<samples/$_.pcm" or die "can't open sample file $_: $!\n";
	binmode IN;
	push @samples, [<IN> =~ /.{2}/sg];
	close IN;
}

sub printSamples {
	my $out = shift;
	printSample($out, $_) for @_;
}

my $last = $#{$samples[0]};
sub printSample {
	my ($out, $mask) = @_;
	my @m = split //, $mask;
	for my $i (0 .. $last) {
		for my $j (@m) {
			print $out ${$samples[$j]}[$i];
		}
	}
}

open IN, '<', $flagFile or die "can't open flag file: $!\n";
binmode IN;

my $flag;
open OUT, '>flag.pcm' or die "can't open output file: $!\n";
binmode OUT;
printSamples(*OUT, unpack("B*", $flag) =~ /.{2}/sg) while (read IN, $flag, 512);
close OUT;
