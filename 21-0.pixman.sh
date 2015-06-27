#!/bin/bash

# path
source $HOME/src/Xorg/0.xorg_env.sh

# freetype
PKG_CONFIG_PATH=$HOME/lib/Xorg/lib/pkgconfig:$HOME/lib/freetype/lib/pkgconfig:$PKG_CONFIG_PATH
echo $PKG_CONFIG_PATH
#--disable-libudev
export LD_LIBRARY_PATH=/lib:/lib64:/usr/lib:/usr/lib64:$LD_LIBRARY_PATH


package=pixman-0.32.6.tar.gz
packagedir=${package%.tar.gz}
wget http://cairographics.org/releases/$package
tar -zxvf $package
pushd $packagedir
./configure $XORG_CONFIG --disable-static
make && make install
popd
rm -rf $packagedir
rm $package
