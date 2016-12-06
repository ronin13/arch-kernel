#!/bin/bash
dest=$1

rm *.pkg.tar.gz
export MAKEFLAGS=-j2
export CFLAGS='-march=x86-64 -O2 -pipe'
export CXXFLAGS='-march=x86-64 -O2 -pipe'
# This is just for testing
wget -O - https://git.archlinux.org/svntogit/packages.git/snapshot/packages-packages/htop.tar.gz | tar zxf -
cd  packages-packages/htop/repos/extra-x86_64/
/usr/sbin/makepkg --skippgpcheck  --nosign 

cp -v *.pkg.tar *.pkg.tar.gz $dest/
