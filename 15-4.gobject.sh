#!/bin/bash

# path
source $HOME/src/Xorg/0.xorg_env.sh

# freetype
PKG_CONFIG_PATH=$HOME/lib/freetype/lib/pkgconfig:$PKG_CONFIG_PATH
echo $PKG_CONFIG_PATH

package=libffi-3.2.1.tar.gz
packagedir=${package%.tar.gz}
wget http://www.mirrorservice.org/sites/sourceware.org/pub/libffi/${package}
tar -zvxf $package
pushd $packagedir
sed -e '/^includesdir/ s/$(libdir).*$/$(includedir)/' -i include/Makefile.in 
sed -e '/^includedir/ s/=.*$/=@includedir@/' \
    -e 's/^Cflags: -I${includedir}/Cflags:/' \
    -i libffi.pc.in

./configure $XORG_CONFIG 
make && make install
popd
rm -rf $packagedir
rm $package

package=glib-2.44.1.tar.xz
packagedir=${package%.tar.xz}
wget http://ftp.gnome.org/pub/gnome/sources/glib/2.44/${package}
tar -vxf $package
pushd $packagedir
./configure $XORG_CONFIG
make && make install
popd
rm -rf $packagedir
rm $package

package=gobject-introspection-1.44.0.tar.xz
packagedir=${package%.tar.xz}
wget  http://ftp.gnome.org/pub/gnome/sources/gobject-introspection/1.44/${package}
tar -vxf $package
pushd $packagedir
./configure $XORG_CONFIG
make && make install
popd
rm -rf $packagedir
rm $package
