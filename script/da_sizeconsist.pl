#!/usr/bin/perl

use strict;
use warnings;

#   find ground state energy in output data
my $inputf;
open ($inputf, "< outdata.txt") or die "Could not open file outdata.txt: $!";
while (my $line = <$inputf>)
{
	if ($line =~ /^NS/)
	{
		my @cont_ns = split (/\s+/, $line);
		print "$line";
	}

	if ($line =~ /^VD/)
	{
		my @cont_vd = split (/\s+/, $line);
		print "$line";
	}

	if ($line =~ /^groud/)
	{
		my @cont_gse = split (/\s+/, $line);
    print "$line";
#    my $num = scalar(@cont_gse);
#    my $e = $cont_gse[4];
#    print "$e\n";
		
	}
}

close ($inputf);
