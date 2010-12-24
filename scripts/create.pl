#!/usr/bin/perl 

use strict;
use warnings;

my $name = $ARGV[0];
open CONTROLLER, "<controller.template";
my $controller_temp;

while(<CONTROLLER>){
    $controller_temp .= $_;
}
close CONTROLLER;

open MODEL, "<model.template";
my $model_temp;
while(<MODEL>){
    $model_temp .= $_;
}

close MODEL;

$controller_temp =~ s/\<name\>/$name/geis;
$model_temp =~ s/\<name\>/$name/geis;

my $controller_name = lc($name).'controller.php';
my $model_name = lc($name).'.php';

my $app_root = '../application/';
open CONTROLLER, "+>$app_root".'controllers/'."$controller_name" or warn "$!";
print 'Creating files '.$name.''
print CONTROLLER $controller_temp;
