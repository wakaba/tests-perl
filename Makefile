WGET = wget
CURL = curl
PERL = perl
PROVE = prove

all: build

deps:

build: build-deps build-main

build-deps: deps

build-main: local/RegexpPattern.pm

local/RegexpPattern.pm:
	mkdir -p local
	echo 'package RegexpPatternTest; ' > $@
	$(CURL) -f -l https://chars.suikawiki.org/set/perlrevars?item=InXMLNameStartChar=%24xml10-5e%3ANameStartChar >> $@
	echo '1;' >> $@
	$(PERL) -c $@

test: test-deps test-main

test-deps: deps build

test-main:
	$(PROVE) t/*.t

always:

## License: Public Domain.
