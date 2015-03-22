#!/usr/bin/perl

use strict;
use warnings;

# Find => Replace
my %data = (
	"/*[[theme_drive]]*/"           => "domain(\"drive.google.com\"), url-prefix(\"http://docs.google.com/document/u/\"), url-prefix(\"https://docs.google.com/document/u/\"), url-prefix(\"http://docs.google.com/spreadsheets/u/\"), url-prefix(\"https://docs.google.com/spreadsheets/u/\")",
	"/*[[theme_docs]]*/"            => "url-prefix(\"http://docs.google.com/document/d/\"), url-prefix(\"https://docs.google.com/document/d/\")",
	"/*[[theme_sheets]]*/"          => "url-prefix(\"http://docs.google.com/spreadsheets/d/\"), url-prefix(\"https://docs.google.com/spreadsheets/d/\"), url-prefix(\"http://docs.google.com/spreadsheet/\"), url-prefix(\"https://docs.google.com/spreadsheet/\")",
	"/*[[theme_sheets_canvas]]*/"   => "url-prefix(\"http://docs.google.com/spreadsheets/d/\"), url-prefix(\"https://docs.google.com/spreadsheets/d/\"), url-prefix(\"http://docs.google.com/spreadsheet/\"), url-prefix(\"https://docs.google.com/spreadsheet/\")",
	"/*[[page_bgrnd_color]]*/"      => "#333333",
	"/*[[normal_text_color]]*/"     => "#DDDDDD",
	"/*[[caret_border_color]]*/"    => "#CC9922",
	"/*[[caret_glow_color]]*/"      => "#FFBB55",
	"/*[[home_sidebar_color]]*/"    => "#404040",
	"/*[[home_list_color]]*/"       => "#333333"
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
