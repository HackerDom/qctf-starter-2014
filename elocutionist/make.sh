#! /bin/sh

./makepng.pl
./makepcm2.pl flag.png 0 1
./makehead.pl flag
flac -8 -f flag.wav
