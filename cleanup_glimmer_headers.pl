#! /usr/bin/perl
#clean fasta headers that come from glimmers multi extract
use strict;

my $file = shift;
open FILE, "$file";
open OUT, ">$file.cleanHeader.fa";

while (<FILE>) {
        chomp;
		if (/>(\S+)/) {
			my @split_list = split(' ', $_);
			print OUT "$split_list[0]-$split_list[1]\n";
		}else{
			print OUT "$_\n";
		}
}