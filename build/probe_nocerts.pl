#!/usr/bin/perl -w

$known_bad{'census.data-archive.ac.uk:8080'} = 1; # it is really http, not https

open(XML,"java -Djava.endorsed.dirs=../tools/xalan/endorsed org.apache.xalan.xslt.Process -IN ../xml/ukfederation-metadata.xml -XSL extract_nocert_locs.xsl|") || die "could not open input file";
while (<XML>) {
	chop;
	if (/^http:/) {
		print "skipping http location: $_\n";
	} elsif (/^https:\/\/([^\/:]+(:\d+)?)(\/|$)/) {
		my $location = $1;
		$location .= ":443" unless defined $2;
		if ($known_bad{$location}) {
			print "skipping known bad location: $_\n";
		} else {
			$locations{$location} = 1;
		}
	} else {
		print "bad location: $_\n";
	}
}
close XML;

$count = scalar keys %locations;
print "Unique SSL non-certificate locations: $count\n";
foreach $loc (sort keys %locations) {
	print "probing: $loc\n";
	$cmd = "openssl s_client -connect $loc -showcerts -verify 10 </dev/null 2>/dev/null ";
	open (CMD, "$cmd|") || die "can't open s_client command";
	$got = 0;
	while (<CMD>) {
		if (/^Server certificate/ .. /\-\-\-/) {
			if (/^issuer=(.*)$/) {
				$issuers{$1}{$loc} = 1;
				$numissued++;
				$got = 1;
			}
		}
	}
	close CMD;
	$failed{$loc} = 1 unless $got;
}
print "\n\n";

$count = scalar keys %failed;
print "\n\nProbes that failed: $count\n";
foreach $loc (sort keys %failed) {
	print "   $loc\n";
}
print "\n\n";

print "Probes we got an issuer back from: $numissued\n";
$count = scalar keys %issuers;
print "Unique issuers: $count\n";
foreach $issuer (sort keys %issuers) {
	%locs = %{ $issuers{$issuer} };
	$n = scalar keys %locs;
	print "$n: $issuer\n";
	foreach $loc (sort keys %locs) {
		print "   $loc\n";
	} 
}
