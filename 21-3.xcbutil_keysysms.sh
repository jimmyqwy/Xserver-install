#!/bin/bash

# path
source $HOME/src/Xorg/0.xorg_env.sh

# freetype
PKG_CONFIG_PATH=$HOME/lib/Xorg/lib/pkgconfig:$HOME/lib/freetype/lib/pkgconfig:$PKG_CONFIG_PATH
echo $PKG_CONFIG_PATH
#--disable-libudev
export LD_LIBRARY_PATH=/lib:/lib64:/usr/lib:/usr/lib64:$LD_LIBRARY_PATH


package=xcb-util-keysyms-0.4.0.tar.bz2
packagedir=${package%.tar.bz2}
wget http://xcb.freedesktop.org/dist/xcb-util-keysyms-0.4.0.tar.bz2
tar -xf $package
pushd $packagedir
./autogen.sh $XORG_CONFIG 
make && make install
popd
rm -rf $packagedir
#rm $package
