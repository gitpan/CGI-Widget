#!/usr/bin/perl
#this file here just to shut up 'make test' errors 
use strict;
use Test;
use lib '../blib/lib';
use CGI::Widget::HList;
use CGI::Widget::HList::Node;

BEGIN {
        if(!eval q{require Tree::DAG_Node}){
           print "# $0 tests skipped because Tree::DAG_Node is not installed\n";
           exit;
        } else {
           {plan tests => 2} 
           my $root = CGI::Widget::HList::Node->new;
           ok(1);
           my $hlist = CGI::Widget::HList->new(-root=>$root);
           ok(2);
         }
      }


1;

