#!/bin/bash

# path
source $HOME/src/Xorg/0.xorg_env.sh

package=libpng-1.6.17.tar.gz
packagedir=${package%.tar.gz}
wget  http://downloads.sourceforge.net/libpng/$package
tar -zxvf $package
pushd $packagedir
./configure $XORG_CONFIG
make && make install
popd
rm -rf $packagedir
rm $package
