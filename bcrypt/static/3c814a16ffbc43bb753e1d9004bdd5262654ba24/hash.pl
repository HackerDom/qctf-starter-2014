#! /usr/bin/perl

use strict;
use warnings;

use Crypt::Eksblowfish::Bcrypt qw(bcrypt_hash);

my $settings = {
	cost => 8,
	salt => pack('H*', 'aad28123bb4983bbb6749ee462cb0e10')
};

my $flag = '****************';

$\ = $/;
$|++;

while (<>) {
	chomp;
	$_ = pack('H*', $_);
	my $hash = bcrypt_hash($settings, $_.$flag);
	print unpack('H*', $hash);
}
