#!/bin/bash
dest=$1

rm *.pkg.tar.gz
# This is just for testing
/usr/sbin/makepkg --skippgpcheck  --nosign --skipchecksums

cp *.pkg.tar.gz $dest/
