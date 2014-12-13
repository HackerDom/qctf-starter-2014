#! /usr/bin/perl

use strict;
use warnings;

my $key = '';

sub test {
	my ($test, $key, $encode, @set) = @_;
	for my $byte (@set) {
		my $h = sprintf "%02x", $byte;
		printf STDERR "test $test$h: ";
		my $t = `echo '$test$h' | ./hash.pl`;
		print STDERR "$encode vs $t\n";
		return $h if $encode eq $t;
	}
	return undef;
}

my @sets = ([97 .. 122], [32, 10, 13], [65 .. 90], [0 .. 255]);

for (reverse 0 .. 71) {
	my $test = '0' x (2 * $_);
	my $encode = `echo $test | ./hash.pl`;
	$test .= $key;
	my $ok = 0;
	for my $set (@sets) {
		my $add = test($test, $key, $encode, @$set);
		if (defined $add) {
			$key .= $add;
			$ok = 1;
			last;
		}
	}
	unless ($ok) {
		print "fail with key $key!!!\n";
		exit 1;
	}
	print STDERR "find: '$key'\n";
}

print "$key\n";
