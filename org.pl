use strict;
use warnings;

use File::Copy;

my $user = $ENV{HOME};

# Storage Directories
my $image_staging = $user . '/Documents/staging/image-staging/';
my $mp4_staging = $user . '/Documents/staging/mp4-staging/';
my $mp3_staging = $user . '/Documents/staging/mp3-staging/';
my $txt_staging = $user . '/Documents/staging/txt-staging/';
my $pdf_staging = $user . '/Documents/staging/pdf-staging/';
my $ebook_staging = $user . '/Documents/staging/ebook-staging/';
my $csv_staging = $user . '/Documents/staging/csv-staging/';
my $zip_staging = $user . '/Documents/staging/zip-staging/';

# Merge path to full absolute path
my $download_folder = $user . "Downloads" . "/";

# Open directory
opendir my $dir, $download_folder or die "Cannot open directory: $!";

