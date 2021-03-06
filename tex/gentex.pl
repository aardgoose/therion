#!/usr/bin/perl

sub encodecxx {
  $str = shift;
  $str =~ s/\x0D//g;
  $str =~ s/\x0C//g;
  $str =~ s/\x0A//g;
  $str =~ s/\\/\\\\/g;
  $str =~ s/\n/\\n/g;
  $str =~ s/\t/\\t/g;
  $str =~ s/\"/\\"/g;
  return $str;
}

print "reading therion.tex\n";

$thtex_library = "";
open(INPT,"therion.tex");
while ($ln = <INPT>) {
  $thtex_library .= "\n\"" . encodecxx($ln) . "\\n\"";
}
close(INPT);

open(OUTPT,">../thtex.h");
print OUTPT <<ENDOUTPT;
/**
 * \@file thmpost.h
 *
 * THIS FILE IS GENERATED AUTOMATICALLY, DO NOT MODIFY IT !!!
 */  
 
#ifndef thtex_h
#define thtex_h

/**
 * Metapost source file.
 */
 
extern const char * thtex_library;
 
#endif
ENDOUTPT
close(OUTPT);


open(OUTPT,">../thtex.cxx");
print OUTPT <<ENDOUTPT;
/**
 * \@file thtex.cxx
 *
 * THIS FILE IS GENERATED AUTOMATICALLY, DO NOT MODIFY IT !!!
 */  

#include "thtex.h"

#ifndef THMSVC

const char * thtex_library = $thtex_library;

#else

const char * thtex_library = "\\\\input therion.tex\\n";

#endif
ENDOUTPT
close(OUTPT);

print "done\n";
