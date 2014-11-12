#!/usr/bin/perl -w 
use strict;
use warnings;
use Cwd 'getcwd';


=begin GHOSTCODE
As described on https://snarfed.org/my_stylish_userstyle_workflow :

	Create a userstyle named "Google Drive Dark Dev" in Stylish, then copy/paste the following:

		@import "file:///<YOUR_PATH_HERE>/Stylish-Google-Drive-Dark/google-drive-dark-stylish.css";
		@-moz-document url-prefix(http), url-prefix(file) {}
=end GHOSTCODE
=cut



my $filename = "google-drive-dark-dev.css";
open(my $fh, ">", $filename) or die "Could not open file '$filename' $!";

my $path = getcwd();
print $fh '@import "file:///' . $path . '/google-drive-dark-stylish.css";' . "\n";
print $fh '@-moz-document url-prefix(http), url-prefix(file) {}' . "\n";

close($fh);
