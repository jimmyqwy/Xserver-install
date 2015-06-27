#!/bin/bash

# path
source $HOME/src/Xorg/0.xorg_env.sh

# freetype
PKG_CONFIG_PATH=$HOME/lib/freetype/lib/pkgconfig:$PKG_CONFIG_PATH
echo $PKG_CONFIG_PATH

package=udev-151.tar.bz2
packagedir=${package%.tar.bz2}
wget http://pkgs.fedoraproject.org/repo/pkgs/udev/udev-151.tar.bz2/aeae0e6273dcbec246c3c1b9868ebed1/udev-151.tar.bz2
tar -jxf $package
pushd $packagedir
./configure $XORG_CONFIG
make && make install
popd
rm -rf $packagedir
rm $package
