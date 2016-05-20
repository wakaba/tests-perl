package RegexpPatternTest;
use strict;
use warnings;
require 'local/RegexpPattern.pm';

print "1..12\n";

my $i = 0;
for my $test (
  qq{\x{43}},
  qq{\x{4e00}},
  qq{\x{100}},
  qq{\x{20000}},
  qq{\x{1FFFE}},
  qq{\x{E0000}},
) {
  if ($test =~ /\A\p{InXMLNameStartChar}\z/) {
    print "ok $i\n";
  } else {
    print "not ok $i # $test\n";
  }
  $i++;
}

for my $test (
  qq{\x{4e00}\x{4e01}},
  qq{\x00},
  qq{\x30},
  qq{\x80},
  qq{\x{D800}},
  qq{\x{FFFF}},
  qq{\x{110000}},
) {
  if ($test =~ /\A\p{InXMLNameStartChar}\z/) {
    print "not ok $i # $test\n";
  } else {
    print "ok $i\n";
  }
  $i++;
}
