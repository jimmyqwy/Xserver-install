#!/bin/bash

# path
source $HOME/src/Xorg/0.xorg_env.sh

package=xcb-proto-1.11.tar.gz
packagedir=${package%.tar.gz}
wget http://xcb.freedesktop.org/dist/$package
tar -zxvf $package
pushd $packagedir
./configure $XORG_CONFIG
make && make install
popd
rm -rf $packagedir
rm $package
