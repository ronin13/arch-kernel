#!/bin/bash
dest=$1
rm *.pkg.tar.*
export MAKEFLAGS=-j2
export CFLAGS='-march=x86-64 -O2 -pipe'
export CXXFLAGS='-march=x86-64 -O2 -pipe'
# This is just for testing
srcname=$(grep '_srcname=' PKGBUILD | cut -d= -f2)

/usr/sbin/makepkg --skippgpcheck  --nosign -o

pushd src/$srcname
    for pp in /patches/*;do 
        patch -p1 -i $pp 
    done
popd 
/usr/sbin/makepkg --skippgpcheck  --nosign  -e

cp -v *.pkg.tar.* $dest/
