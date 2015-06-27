#!/bin/bash

# path
source $HOME/src/Xorg/0.xorg_env.sh

package=libxcb-1.11.tar.gz
packagedir=${package%.tar.gz}
wget http://xcb.freedesktop.org/dist/$package
tar -zxvf $package
pushd $packagedir
sed -i "s/pthread-stubs//" configure
./configure $XORG_CONFIG --enable-xinput --docdir=$HOME/lib/Xorg/share/doc/libxcb-1.11
make && make install
popd
rm -rf $packagedir
rm $package
