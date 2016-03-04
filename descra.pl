#!/usr/bin/perl
use Math::Trig ':pi';

#2.632 kHz, 2.718 kHz, 2.868 kHz, 3.023 kHz, 3.107 kHz, 3.196 kHz, 3.333 kHz, 3.339 kHz, 3.496 kHz, 3.729 kHz and 4.096
#$fc = 3333; # carrier frequency
$fc=`zenity --scale --text="Select frequency \n2.632 kHz, 2.718 kHz, 2.868 kHz, 3.023 kHz, 3.107 kHz, 3.196 kHz, 3.333 kHz, 3.339 kHz, 3.496 kHz, 3.729 kHz and 4.096" --value="3333" --min-value="2000" --max-value="5000" –step="2"`;

$fs = 48000; # sample rate
$filter = " sinc -$fc"; # optional LP filter
 
$fc = freq($fc);
 
open(IN, "nc -l -u 7355 |");
open(OUT,"| sox -r $fs -t .raw -e signed-integer -b 16 -c 1 -v 10.0 -V1 - -d".
$filter);
 
while (not eof IN) {
 
$acc += $fc;
$acc -= 65536 if ($acc > 32767);
 
read(IN,$a,2);
print OUT pack("s",unpack("s",$a) * sin($acc/32768*pi));
}
 
sub freq { int(.5 + $_[0] * 65536 / $fs); } 
