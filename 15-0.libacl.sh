#!/bin/bash

# path
source $HOME/src/Xorg/0.xorg_env.sh

# freetype
PKG_CONFIG_PATH=$HOME/lib/freetype/lib/pkgconfig:$PKG_CONFIG_PATH
echo $PKG_CONFIG_PATH


package=attr-2.4.47.src.tar.gz
packagedir=${package%.src.tar.gz}
wget http://download.savannah.gnu.org/releases/attr/${package}
tar -zxf $package
pushd $packagedir

sed -i -e 's|/@pkg_name@|&-@pkg_version@|' include/builddefs.in
INSTALL_USER=${username}  \
INSTALL_GROUP=${groupname} \
./configure $XORG_CONFIG --disable-static
make && make install install-dev install-lib
popd
rm -rf $packagedir
rm $package



package=acl-2.2.52.src.tar.gz
packagedir=${package%.src.tar.gz}
wget http://download.savannah.gnu.org/releases/acl/${package}
tar -zxf $package
pushd $packagedir

sed -i -e 's|/@pkg_name@|&-@pkg_version@|' \
         include/builddefs.in
INSTALL_USER=${username}  \
INSTALL_GROUP=${groupname} \
./configure $XORG_CONFIG --libexecdir=$HOME/lib/Xorg/lib --disable-static
make && make install install-dev install-lib
popd
rm -rf $packagedir
rm $package
