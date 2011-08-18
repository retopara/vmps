#!/usr/bin/perl

use strict;
use warnings;

#   find ground state energy in output data
my $inputf;
open ($inputf, "< outdata.txt") or die "Could not open file outdata.txt: $!";
while (my $line = <$inputf>)
{
	if ($line =~ /^groud/)
	{
		my @cont_gse = split (/\s+/, $line);
    print "$line\n"
#    my $num = scalar(@cont_gse);
		my $e = $cont_gse[4];
    print "$e\n";
		
	}
}

close ($inputf);
