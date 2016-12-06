#!/bin/bash
dest=$1
rm *.pkg.tar.gz
export MAKEFLAGS=-j2
export CFLAGS='-march=x86-64 -O2 -pipe'
export CXXFLAGS='-march=x86-64 -O2 -pipe'
# This is just for testing
pushd src/linux-4.8
    for pp in /patches/*;do 
        patch -p1 -i $pp 
    done
popd 
/usr/sbin/makepkg --skippgpcheck  --nosign 

cp -v *.pkg.tar.* $dest/
