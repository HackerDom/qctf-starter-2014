#!/usr/bin/perl

use strict;
use warnings;

use WAV;

my $file = shift;
my $rate = shift;

open IN, '<', $file.'.pcm' or die "can't open $file.pcm: $!\n";
open OUT, '>', $file.'.wav' or die "can't open $file.wav: $!\n";

binmode IN;
binmode OUT;

my $size = -s $file.'.pcm';
print STDERR "makehead: pcm size $size bytes\n";
print OUT createHeader $size, $rate, 2;

print OUT while (read IN, $_, 1024);
