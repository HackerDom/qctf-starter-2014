package WAV;

use strict;
use warnings;

require Exporter;

our @ISA = qw/ Exporter /;

our @EXPORT = qw/ createHeader /;

sub createHeader {
	my $lenTrack = shift;
	my $rate = shift || 96000;
	my $channels = shift || 1;

	my $res = '';

	$res = pack "L", $lenTrack;
	$res = 'data' . $res;
	$res = (pack "S", 16) . $res; # бит на семпл 
	$res = (pack "S", 2 * $channels) . $res; # байт на семпл, все каналы
	$res = (pack "L", 2 * $rate * $channels) . $res; # байт в секунду
	$res = (pack "L", $rate) . $res; # частота
	$res = (pack "S", $channels) . $res; # число каналов
	$res = (pack "S", 1) . $res; # PCM
	$res = (pack "L", 16) . $res; # длина
	$res = 'fmt ' . $res;
	$res = 'WAVE' . $res;
	$res = (pack "L", length($res) + $lenTrack) . $res;
	$res = 'RIFF' . $res;

	return $res;
}

1;
