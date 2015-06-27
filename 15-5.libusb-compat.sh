#!/bin/bash

# path
source $HOME/src/Xorg/0.xorg_env.sh

# freetype
PKG_CONFIG_PATH=$HOME/lib/freetype/lib/pkgconfig:$PKG_CONFIG_PATH
echo $PKG_CONFIG_PATH

package=libusb-compat-0.1.5.tar.bz2
packagedir=${package%.tar.bz2}
wget http://downloads.sourceforge.net/libusb/${package}
tar -jxf $package
pushd $packagedir
./configure $XORG_CONFIG
make && make install
popd
rm -rf $packagedir
rm $package
