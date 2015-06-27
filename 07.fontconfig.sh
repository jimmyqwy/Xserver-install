#!/bin/bash

# path
source $HOME/src/Xorg/0.xorg_env.sh

# freetype
PKG_CONFIG_PATH=$HOME/lib/freetype/lib/pkgconfig:$PKG_CONFIG_PATH
echo $PKG_CONFIG_PATH

package=fontconfig-2.11.1.tar.gz
packagedir=${package%.tar.gz}
wget http://www.freedesktop.org/software/fontconfig/release/$package
tar -zxvf $package
pushd $packagedir
./configure --prefix=$HOME/lib/Xorg
            --sysconfdir=$HOME/lib/Xorg/etc
            --localstatedir=$HOME/lib/Xorg/var
            --disable-docs --docdir=$HOME/lib/Xorg/share/doc/fontconfig-2.11.1
make && make install
popd
rm -rf $packagedir
rm $package
