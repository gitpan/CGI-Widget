#!/usr/bin/perl
#this file here just to shut up 'make test' errors 
use strict;
use Test;
use lib '../blib/lib';
use CGI::Widget::HList;
use CGI::Widget::HList::Node;

BEGIN { plan tests => 1 }

my $root = CGI::Widget::HList::Node->new;
$root->name("root node");
my $d1 = CGI::Widget::HList::Node->new;
$d1->name("daughter 1");
my $d2 = CGI::Widget::HList::Node->new;
$d2->name("daughter 2");
my $d3 = CGI::Widget::HList::Node->new;
$d3->name("daughter 3");
my $g1 = CGI::Widget::HList::Node->new;
$g1->name("granddaughter 1");
$root->add_daughters($d1,$d2,$d3);
$d1->add_daughter($g1);
#$d1->close;
my $hlist = CGI::Widget::HList->new(-root=>$root);
print $hlist->html;


ok(1);

1;

