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
my $download_folder = $user . "/Downloads" . "/";

# Open directory
opendir my $dir, $download_folder or die "Cannot open directory: $!";

# Read all files in DL directory
my @files = readdir $dir;
closedir $dir;

## Filter for file type from @files.
my @image_files = grep(/.png/ || /.jpg/ || /.jpeg/, @files);
my @mp4_files = grep(/.mp4/, @files);
my @mp3_files = grep(/.mp3/, @files);
my @txt_files = grep(/.txt/, @files);
my @pdf_files = grep(/.pdf/, @files);
my @ebook_files = grep(/.epub/ || /.mobi/, @files);
my @csv_files = grep(/.csv/ || /.xls/ || /.xlsx/, @files);
my @zip_files = grep(/.zip/, @files);

# main Function
sub moveFileByType {
  my @file_array = @{$_[0]}; # required to take an array as an arg
  my $staging_path = $_[1];

  foreach my $file (@file_array) {
    my $old = $download_folder . $file;
    my $staging = $staging_path;

    move($old, $staging) or die "Move $old -> $staging failed: $!";

    print "file: " . $file . " has been moved\n";
  };
};

# Move implementation
moveFileByType(\@image_files, $image_staging); # passes array reference
moveFileByType(\@mp4_files, $mp4_staging);
moveFileByType(\@mp3_files, $mp3_staging);
moveFileByType(\@txt_files, $txt_staging);
moveFileByType(\@pdf_files, $pdf_staging);
moveFileByType(\@ebook_files, $ebook_staging);
moveFileByType(\@csv_files, $csv_staging);
moveFileByType(\@zip_files, $zip_staging);

