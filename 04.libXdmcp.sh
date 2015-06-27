#!/bin/bash

# path
source $HOME/src/Xorg/0.xorg_env.sh

package=libXdmcp-1.1.2.tar.gz
packagedir=${package%.tar.gz}
wget http://ftp.x.org/pub/individual/lib/$package
tar -zxvf $package
pushd $packagedir
./configure $XORG_CONFIG
make && make install
popd
rm -rf $packagedir
rm $package
