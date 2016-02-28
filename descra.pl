#!/usr/bin/perl
#2.632 kHz, 2.718 kHz, 2.868 kHz, 3.023 kHz, 3.107 kHz, 3.196 kHz, 3.333 kHz, 3.339 kHz, 3.496 kHz, 3.729 kHz and 4.096
$fc = 3333; # carrier frequency

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
print OUT pack("s",unpack("s",$a) * sin($acc/32768*3.141592653589793));
}
 
sub freq { int(.5 + $_[0] * 65536 / $fs); } 
