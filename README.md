Arch kernel build CI  [![Build Status](https://travis-ci.org/ronin13/arch-kernel.svg?branch=master)](https://travis-ci.org/ronin13/arch-kernel)
---------
![arch logo](images/logo.png)    ![tux](images/tux.png)

- Files in this tree are used to build Archlinux kernel on Travis CI. 
- The build runs inside a docker container. 
- [pritunl/archlinux](https://hub.docker.com/r/pritunl/archlinux/) is used as the base docker image.
- Build config used by default is the one generated with `make localmodconfig` on my laptop.
    - Laptop config: [inxi](https://gist.github.com/ronin13/73e7414ffc7eede6108a0d7853d0ba15)
    - This is also required since there is a 50m time limit on free builds (-j2) on Travis.
- Only linux package (so no headers, docs) is built.
- The docker container in which the build runs is also built on travis.
    + The build runs as `nobody` user.
    + `id -u` is passed as build argument so that volume can be written to from inside container by `nobody`.
        - This ensures the nobody user has same uid both inside and outside the container.
- Built pkg.tar.xz is uploaded to github releases.

### Note
Patches in patches/ directory are my local fixes and workarounds, and may not hold much interest to others.

## More

Pull requests and forks welcome!
