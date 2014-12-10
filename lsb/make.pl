#! /usr/bin/perl

use strict;
use warnings;

use Imager;

my @order = (0, 1, 1, 2, 3, 1, 2, 0, 3, 3, 2, 0);

sub setBit {
	my ($byte, $bit, $value) = @_;

	if ($value) {
		$byte |= 1 << $bit;
	}
	else {
		$byte &= ~(1 << $bit);
	}

	return $byte;
}

sub setPixel {
	my ($img, $x, $y, $mess) = @_;
	my @set = (0, 0, 0, 0);

	my @col = $img -> getpixel(x => $x, y => $y) -> rgba();
	my @mes = split //, $mess;
	for (0 .. $#order) {
		my $pos = $set[$order[$_]]++;
		$col[$order[$_]] = setBit($col[$order[$_]], $pos, $mes[$_]);
	}

	$img -> setpixel(x => $x, y => $y, color => Imager::Color -> new($col[0], $col[1], $col[2], $col[3]));
}

my $image = Imager -> new(file => "orig.png") or die Imager -> errstr();

open IN, '<flag.txt' or die "can't open flag file\n";
my $flag = <IN>;

$flag = unpack "B*", $flag;

$flag .= '0' while length($flag) % 12;

my ($x, $y) = (0, 0);
for ($flag =~ /.{12}/sg) {
	setPixel($image, $x, $y, $_);
	++$x;
	if ($x >= $image -> getwidth()) {
		$x = 0;
		++$y;
	}
}

$image -> write(file => 'fof.png');
#print length ($flag) / 12;
