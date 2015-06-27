#!/bin/bash

# path
source $HOME/src/Xorg/0.xorg_env.sh

# freetype
PKG_CONFIG_PATH=$HOME/lib/freetype/lib/pkgconfig:$PKG_CONFIG_PATH
echo $PKG_CONFIG_PATH

package=libusb-1.0.19.tar.bz2
packagedir=${package%.tar.bz2}
wget http://downloads.sourceforge.net/libusb/${package}
tar -jxf $package
pushd $packagedir
./configure $XORG_CONFIG --disable-udev
make && make install
popd
rm -rf $packagedir
rm $package
