#! /usr/bin/perl

use strict;
use warnings;
use Imager;
use constant {
		fontSize => 15,
		padding => 5,
		fontWidth => 15
};

open IN, '<flag.txt' or die "can't open flag file: $!\n";
my $flag = <IN>;
chomp $flag;
close IN;

#$flag = " $flag ";

my $xsize = fontWidth * length $flag;
my $ysize = fontSize + 2 * padding;

my $font = Imager::Font -> new(file => 'technicality.ttf', size => fontSize, color => 'white') or die Imager -> errstr."\n";

my $img = Imager -> new(xsize => $xsize, ysize => $ysize);

for my $x (0 .. $xsize) {
	for my $y (0 .. $ysize) {
		$img -> setpixel(x => $x, y => $y, color => Imager::Color -> new (int rand 2, int rand 2, int rand 2));
	}
}

$img -> string(x => padding, y => $ysize - padding, string => $flag, font => $font);
$img -> write(file => 'flag.png') or die $img -> errstr;
