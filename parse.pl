#!/usr/bin/perl

use strict;
use warnings;

# Find => Replace
my %data = (
	"/*[[page_bgrnd_color]]*/"   => "#333333",
	"/*[[normal_text_color]]*/"  => "#DDDDDD",
	"/*[[caret_border_color]]*/" => "#CC9922",
	"/*[[caret_glow_color]]*/"   => "#FFBB55",
	"/*[[home_sidebar_color]]*/" => "#404040",
	"/*[[home_list_color]]*/"    => "#333333"
);

open(my $in, '<', 'google-drive-dark-userstyles.css') or die "Could not open file '$_' $!";
open(my $out, '>', 'google-drive-dark-stylish.css') or die "Could not open file '$_' $!";

while (my $line = readline($in))
{
	foreach (keys %data)
	{
		$line =~ s/\Q$_/$data{$_}/g;
	}

	print $out $line;
}

close($out);
