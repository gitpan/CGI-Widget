#!/usr/bin/perl
use lib '../blib/lib';
use strict;
use CGI::Widget ":standard";

print Series(-length=>10,-render=>sub{return "asdf".shift});
