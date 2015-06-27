#!/bin/bash

# path
source $HOME/src/Xorg/0.xorg_env.sh

# freetype
PKG_CONFIG_PATH=$HOME/lib/freetype/lib/pkgconfig:$PKG_CONFIG_PATH
echo $PKG_CONFIG_PATH

package=xcb-util-wm-0.4.1.tar.gz
packagedir=${package%.tar.gz}
wget http://xcb.freedesktop.org/dist/$package
tar -zxvf $package
pushd $packagedir
./configure $XORG_CONFIG
make && make install
popd
rm -rf $packagedir
rm $package
