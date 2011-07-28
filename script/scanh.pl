#!/usr/bin/perl 

use strict;
use warnings;

#   used to store line number
my $ln_ns;
my $ln_vd;
my $ln_mth;
my $ln_init_cfg;
my $ln_cl;
my $ln_j1x;
my $ln_j1y;
my $ln_j1z;
my $ln_j2x;
my $ln_j2y;
my $ln_j2z;
my $ln_hx;
my $ln_hy;
my $ln_hz;
my $ln_tol;
my $ln_calc_fes;
my $ln_use_pbc; 
my $ln_out_mag;
my $ln_out_corr; 
my $ln_out_cfg;

#   find line number of 
my $inputf;
open ($inputf, "< input.qs") or die "Cound not open file input.qs: $!";
while (my $line = <$inputf>)
{
    if ($line =~ /^NS/) {$ln_ns = $.;}
    if ($line =~ /^VD/) {$ln_vd = $.;}
    if ($line =~ /^MTH/) {$ln_mth = $.;}
    if ($line =~ /^INIT_CFG/) {$ln_init_cfg = $.;}
    if ($line =~ /^CL/) {$ln_cl = $.;}
    if ($line =~ /^J1X/) {$ln_j1x = $.;}
    if ($line =~ /^J1Y/) {$ln_j1y = $.;}
    if ($line =~ /^J1Z/) {$ln_j1z = $.;}
    if ($line =~ /^J2X/) {$ln_j2x = $.;}
    if ($line =~ /^J2Y/) {$ln_j2y = $.;}
    if ($line =~ /^J2Z/) {$ln_j2z = $.;}
    if ($line =~ /^HX/) {$ln_hx = $.;}
    if ($line =~ /^HY/) {$ln_hy = $.;}
    if ($line =~ /^HZ/) {$ln_hz = $.;}
    if ($line =~ /^TOL/) {$ln_tol = $.;}
    if ($line =~ /^CALC_FES/) {$ln_calc_fes = $.;}
    if ($line =~ /^USE_PBC/) {$ln_use_pbc = $.;}
    if ($line =~ /^OUT_MAG/) {$ln_out_mag = $.;}
    if ($line =~ /^OUT_CORR/) {$ln_out_corr = $.;}
    if ($line =~ /^OUT_CFG/) {$ln_out_cfg = $.;}
}

close ($inputf);

#   the best way to modify contents of a file is to 
#   fetch each line into an array and modfify its contents
#   and then write to the file

#   write data
open (my $ofs, ">", "suspectibility.txt") or die "Could not open file suspectibility.txt: $!";

for (my $h=0.0; $h <= 2.1; $h+=0.01)
{
    print "$h\n";

    open (my $infile, "<", "input.qs") or die "Cound not open file input.qs: $!";
    my @lines = <$infile>;
    close $infile;

    #   modify HZ
    my @new_cont_hz = split (/\s+/, $lines[$ln_hz-1]);
    $new_cont_hz[1] = "$h\n";
    $lines[$ln_hz-1] = join ("      ", @new_cont_hz);

    #   output to file
    open (my $outfile, ">", "input.qs") or die "Cound not open file input.qs: $!";
    print {$outfile} @lines;
    close $outfile;

    system ("./qsAnnni");

    #   fetch data
    open (my $fetchdata, "<", "output_res.qs") or die "Cound not open file output_res.qs: $!";
    my @data = <$fetchdata>;
    close $fetchdata;

    foreach my $data_term (@data)
    {
        #  if ($data_term =~ /^magnetization along Z axis is:\s+(\d+)\s+(\d+)\s+/)
        if ($data_term =~ /^magnetization along Z axis is:\s(\d+\.\d+)/)
        {
            print {$ofs} "$h   $1\n";
        }
    }
}

close $ofs;
