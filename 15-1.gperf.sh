#!/bin/bash

# path
source $HOME/src/Xorg/0.xorg_env.sh

# freetype
PKG_CONFIG_PATH=$HOME/lib/freetype/lib/pkgconfig:$PKG_CONFIG_PATH
echo $PKG_CONFIG_PATH

package=gperf-3.0.4.tar.gz
packagedir=${package%.tar.gz}
wget  http://ftp.gnu.org/gnu/gperf/${package}
tar -zxf $package
pushd $packagedir
./configure $XORG_CONFIG
make && make install
popd
rm -rf $packagedir
rm $package
