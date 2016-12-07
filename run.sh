#!/bin/bash
dest=$1
rm *.pkg.tar.*
export MAKEFLAGS=-j2
export CFLAGS='-march=x86-64 -O2 -pipe'
export CXXFLAGS='-march=x86-64 -O2 -pipe'

gpg --recv-keys 647F28654894E3BD457199BE38DBBDC86092693E
gpg --recv-keys 79BE3E4300411886

srcname=$(grep '_srcname=' PKGBUILD | cut -d= -f2)

/usr/sbin/makepkg  --nosign -o

pushd src/$srcname
    for pp in /patches/*;do 
        patch -p1 -i $pp 
    done
popd 
/usr/sbin/makepkg --nosign  -e

cp -v *.pkg.tar.* $dest/
