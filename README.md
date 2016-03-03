# Descrambler-for-GQRX
Voice descrambler for GQRX

A perl script from here http://www.windytan.com/2013/05/descrambling-voice-inversion.html<br>
Changed to work with GQRX udp output

Scrambled voice used in some ham radios to secure communication.<br>
Enconding method is "voice inversion" and the sound reminds Donald Duck.<br>
https://en.wikipedia.org/wiki/Voice_inversion

Change $fc = 3333; # carrier frequency to tune voice decoding.
