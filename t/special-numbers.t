use strict;
use warnings;

print "1..10\n";

my $i = 1;

for (
  [0+'nan', 'NaN', 'nan', "\x00\x00\x00\x00", qr/^Cannot pack NaN with/],
  [0+'NaN', 'NaN', 'nan', "\x00\x00\x00\x00", qr/^Cannot pack NaN with/],
  [0+'inf', 'Inf', 'inf', "\xFF\xFF\xFF\xFF", qr/^Cannot pack Inf with/],
  [0-'inf', '-Inf', '-inf', "\x00\x00\x00\x00", qr/Cannot pack -Inf with/],
  [0+'-inf', '-Inf', '-inf', "\x00\x00\x00\x00", qr/Cannot pack -Inf with/],
) {
  my ($input, $expected1, $expected2, $expected3, $expected4) = @$_;
  if ($input eq (v5.22 le $^V ? $expected1 : $expected2)) {
    print "ok $i # $input\n";
  } else {
    print "not ok $i # $input\n";
  }
  $i++;

  my $got = eval { pack 'L', $input };
  my $x = v5.22 le $^V ? $expected4 : $expected3;
  if ($@) {
    if (ref $x and $@ =~ /^$x/) {
      print "ok $i\n";
    } else {
      print "not ok $i # exception $@\n";
    }
  } else {
    if (not ref $x and $got eq $x) {
      print "ok $i\n";
    } else {
      $got =~ s/(.)/sprintf '%%%02X', ord $1/ges;
      print "not ok $i # $got\n";
    }
  }
  $i++;
}
