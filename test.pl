BEGIN { $| = 1; print "1..1\n"; }
END {print "not ok 1\n" unless $loaded;}

use MDiff;

$loaded = 1;
print "ok 1\n";

print "m-different 1.\n" if is_mdiff(3, "wordhi", "wORd");
print "m-different 2.\n" if is_mdiff(2, "wordhi", "wORd");

print "m-different 3.\n" if is_mdiff(3, "word", "wORd");
print "m-different 4.\n" if is_mdiff(2, "word", "wORd");
