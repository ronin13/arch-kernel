Travis Arch  kernel build
---------
[![Build Status](https://travis-ci.org/ronin13/arch-kernel.svg?branch=master)](https://travis-ci.org/ronin13/arch-kernel)

- Following files are used to build Archlinux kernel on Travis CI. 
- The build runs inside a docker container. 
- pritunl/archlinux is used as the base docker image.
- Build pkg.tar.xz is uploaded to github releases.
- Build config used by default is the one generated with `make localmodconfig` on my laptop.
- Only linux package (so no headers, docs) is built.
- The docker container in which the build runs is also built on travis.
    + The build runs as `nobody` user.
    + `id -u` is passed as build argument so that volume can be written to from inside container by `nobody`.

## More

Pull requests and forks welcome!
