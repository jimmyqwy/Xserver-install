#!/bin/bash

# path
source $HOME/src/Xorg/0.xorg_env.sh

# freetype
PKG_CONFIG_PATH=$HOME/lib/Xorg/lib/pkgconfig:$HOME/lib/freetype/lib/pkgconfig:$PKG_CONFIG_PATH
echo $PKG_CONFIG_PATH
#--disable-libudev
export LD_LIBRARY_PATH=/lib:/lib64:/usr/lib:/usr/lib64:$LD_LIBRARY_PATH


package=libepoxy-1.2.tar.gz
packagedir=${package%.tar.gz}
#wget --no-check-certificate http://crux.nu/files/libepoxy-1.2.tar.gz
tar -zxvf $package
pushd $packagedir
./autogen.sh $XORG_CONFIG 
make && make install
popd
rm -rf $packagedir
#rm $package
