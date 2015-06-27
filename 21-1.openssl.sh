#!/bin/bash

# path
source $HOME/src/Xorg/0.xorg_env.sh

# freetype
PKG_CONFIG_PATH=$HOME/lib/Xorg/lib/pkgconfig:$HOME/lib/freetype/lib/pkgconfig:$PKG_CONFIG_PATH
echo $PKG_CONFIG_PATH
#--disable-libudev
export LD_LIBRARY_PATH=/lib:/lib64:/usr/lib:/usr/lib64:$LD_LIBRARY_PATH


package=openssl-1.0.2c.tar.gz
packagedir=${package%.tar.gz}
#wget --no-check-certificate https://openssl.org/source/$package
tar -zxvf $package
pushd $packagedir
./configure $XORG_CONFIG --openssldir=$HOME/lib/Xorg/etc/ssl --libdir=$HOME/lib/Xorg/lib --disable-apps shared zlib-dynamic  linux-x86_64-clang 
make && make install
popd
#rm -rf $packagedir
#rm $package
