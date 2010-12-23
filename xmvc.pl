use strict;
use warnings;
use File::Copy;

my $name = $ARGV[0];
die 'No name specified' unless $name;
my @dir_arr = qw( application config db library public scripts tmp );
my $root = '../'.$name.'/';
mkdir $root;
populate_dir($root,\@dir_arr);
populate_application();
populate_public();
populate_tmp();

sub populate_dir {
    my ( $path, $arr_ref ) = @_;
    foreach my $dir(@{$arr_ref}){
        print 'creating directory '."$path$dir\n";
        mkdir "$path$dir".'/';
    }
    return 1;
}
sub copy_files {
    my ($from, $to) = @_;
    opendir( DIR , $from );
    while ( my $filename = readdir(DIR)){
        next if $filename eq '.' || $filename eq '..';
        copy ("$from$filename","$to$filename") or die "fail to copy$!";
    }
}

sub make_dir {
    
sub populate_application {
    my $path = $root.'application/';
    my @dir_arr = qw( controllers models views );
    populate_dir($path, \@dir_arr);
    foreach my $dir(@dir_arr) {
        copy_files("application\/$dir\/","$path$dir\/");
    }
}

sub populate_public {
    my $path = $root.'public/';
    my @dir_arr = qw( css img js swf);
    populate_dir($path, \@dir_arr);
}

sub populate_tmp {
    my $path = $root.'tmp/';
    my @dir_arr = qw( cache logs sessions);
    populate_dir($path, \@dir_arr);
}
    
