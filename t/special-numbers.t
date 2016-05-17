use strict;
use warnings;

print "1..5\n";

my $i = 1;

for (
  [0+'nan', 'NaN', 'nan'],
  [0+'NaN', 'NaN', 'nan'],
  [0+'inf', 'Inf', 'inf'],
  [0-'inf', '-Inf', '-inf'],
  [0+'-inf', '-Inf', '-inf'],
) {
  my ($input, $expected1, $expected2) = @$_;
  if ($input eq (v5.22 le $^V ? $expected1 : $expected2)) {
    print "ok $i # $input\n";
  } else {
    print "not ok $i # $input\n";
  }
  $i++;
}
