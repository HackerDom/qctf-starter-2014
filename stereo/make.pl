#!/usr/bin/perl

use strict;
use warnings;
use constant (sh => 200);

use Imager;

sub makeStreo {
	my ($mask, $image, $x, $y, $i) = @_;

	my ($w, $h) = ($mask -> getwidth(), $mask -> getheight());
	my @mask;
	for $x (0 .. $w - 1) {
		my @submask;
		for $y (0 .. $h - 1) {
			push @submask, int(($mask -> getpixel(x => $x, y => $y) -> rgba())[0] / 32);
		}
		push @mask, [@submask];
	}

	my $res = $image;

	for $y (0 .. $h - 1) {
		for $x (0 .. $w - 1) {
			next if ${$mask[$x]}[$y] == 0;
			my $sh = ${$mask[$x]}[$y];
			my $color = $res -> getpixel(x => $x + $sh, y => $y);
			$i = $x + sh;
			while ($i < $w + sh - $sh) {
				$res -> setpixel(x => $i, y => $y, color => $color);
				$i += sh;
			}
		}
	}

	return $res;
}

sub max($$) {
	return $_[0] < $_[1] ? $_[1] : $_[0];
}

sub genColor() {
	my @res = (0) x 3;
	$res[0] = int rand 256;
	$res[1] = int rand $res[0];
	$res[2] = int rand $res[1];
	return sort {int rand 2} @res;
}

my @maskFiles = @ARGV;

my @masks = map {Imager -> new(file => $_) or die Imager -> errstr()} @maskFiles;

my $h = max($masks[0] -> getheight(), $masks[1] -> getwidth());
my $w = max($masks[0] -> getwidth(), $masks[1] -> getheight());

my $image = Imager -> new(xsize => $w + sh, ysize => $h + sh);
my ($x, $y, $i);
for $x (0 .. sh - 1) {
	for $y (0 .. sh - 1) {
		my $color = Imager::Color -> new(genColor());
		$image -> setpixel(x => $x, y => $y, color => $color);
	}
}

for $x (0 .. $w + sh - 1) {
	for $y (0 .. $h + sh - 1) {
		next if $x < sh && $y < sh;
		my $color = $image -> getpixel(x => $x % sh, y => $y % sh);
		$image -> setpixel(x => $x, y => $y, color => $color);
	}
}

$image = makeStreo($masks[0], $image);

$image = $image -> rotate(right => 270);

$image = makeStreo($masks[1], $image);

$image = $image -> rotate(right => 180);

$image -> write(file => "dragon.jpg");
