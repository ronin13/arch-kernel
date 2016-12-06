#!/bin/bash
dest=$1

rm *.pkg.tar.gz
export MAKEFLAGS=-j2
export CFLAGS='-march=x86-64 -O2 -pipe'
export CXXFLAGS='-march=x86-64 -O2 -pipe'
# This is just for testing
/usr/sbin/makepkg --skippgpcheck  --nosign --skipchecksums

cp *.pkg.tar.gz $dest/
