#!/bin/bash

# path
source $HOME/src/Xorg/0.xorg_env.sh

# freetype
PKG_CONFIG_PATH=$HOME/lib/freetype/lib/pkgconfig:$PKG_CONFIG_PATH
echo $PKG_CONFIG_PATH

package=libdrm-2.4.61.tar.gz
packagedir=${package%.tar.gz}
wget http://dri.freedesktop.org/libdrm/$package
tar -zxvf $package
pushd $packagedir

sed -e "/pthread-stubs/d" -i configure.ac &&
autoreconf -fiv &&
./configure --prefix=$HOME/lib/Xorg --enable-udev

make && make install
popd
rm -rf $packagedir
rm $package
