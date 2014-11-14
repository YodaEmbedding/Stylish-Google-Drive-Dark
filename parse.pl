#!/usr/bin/perl

use strict;
use warnings;

# use File::Copy qw(copy);
# copy('google-drive-dark-userstyles.css', 'google-drive-dark-stylish.css') or die "Copy failed: $!";
# $ perl -pi.bak -e 's/\/\*\[\[page_bgrnd_color\]\]\*\//#333333/g' google-drive-dark-stylish.css

# find, replace
# '/*[[page_bgrnd_color]]*/',   '#333333'
# '/*[[normal_text_color]]*/',  '#DDDDDD'
# '/*[[caret_border_glow]]*/',  '#CC9922'
# '/*[[caret_glow_color]]*/',   '#FFBB55'
# '/*[[home_sidebar_color]]*/', '#404040'
# '/*[[home_list_color]]*/',    '#333333'

my %data = (
	"/*[[page_bgrnd_color]]*/"   => "#333333",
	"/*[[normal_text_color]]*/"  => "#DDDDDD",
	"/*[[caret_border_color]]*/"  => "#CC9922",
	"/*[[caret_glow_color]]*/"   => "#FFBB55",
	"/*[[home_sidebar_color]]*/" => "#404040",
	"/*[[home_list_color]]*/"    => "#333333"
);

# print "$_ $data{$_}\n" for (keys %data);
# $^I = '.bak'; # create a backup copy 

open(my $in, '<', 'google-drive-dark-userstyles.css') or die "Could not open file '$_' $!";
open(my $out, '>', 'google-drive-dark-stylish.css') or die "Could not open file '$_' $!";

while (my $line = readline($in)) {
	foreach (keys %data)
	{
		$line =~ s/\Q$_/$data{$_}/g; # do the replacement
		# print $_, ', ';
	}

	print $out $line; # print to the modified file
	print $line;

   # s/$data/$data{}/g; # do the replacement
   # print; # print to the modified file
}

close($out);
