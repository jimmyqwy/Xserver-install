#!/bin/bash

# path
source $HOME/src/Xorg/0.xorg_env.sh

package=xkeyboard-config-2.15.tar.bz2
packagedir=xkeyboard-config-2.15
wget  http://ftp.x.org/pub/individual/data/xkeyboard-config/$package
tar -xf $package
pushd $packagedir
./configure $XORG_CONFIG --with-xkb-rules-symlink=xorg
make && make install
popd
rm -rf $packagedir
rm $package
