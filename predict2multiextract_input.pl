#!/usr/bin/perl
#convert Glimmer "predict" output files to suitable input files for the Multi extract utility
#Written by Tom de Man

use strict;

my $file = shift;
my $name;

open FILE, "$file";
open OUT, ">$file.multi-extract-input";

while (<FILE>) {
        chomp;
        if (/>(\S+)/) {
       		$name=$1;
       		#print "$name\n";
        }else {
        	my @split_list = split(' ', $_);
        	print OUT "$split_list[0]\t$name\t$split_list[1]\t$split_list[2]\t$split_list[3]\n";
        }
}