use strict;
use warnings;

print "1..1\n";

my $vd = sprintf '%vd', $^V;
if ($vd =~ /\A5\.(?:[1-9][0-9]*|0)\.(?:[1-9][0-9]*|0)\z/) {
  print "ok 1 # $vd\n";
} else {
  print "not ok 1 # $vd\n";
}
