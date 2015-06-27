#!/bin/bash

# path
source $HOME/src/Xorg/0.xorg_env.sh

# freetype
PKG_CONFIG_PATH=$HOME/lib/Xorg/lib/pkgconfig:$HOME/lib/freetype/lib/pkgconfig:$PKG_CONFIG_PATH
echo $PKG_CONFIG_PATH
#--disable-libudev
export LD_LIBRARY_PATH=/lib:/lib64:/usr/lib:/usr/lib64:$LD_LIBRARY_PATH

package=xorg-server-1.17.2.tar.bz2
packagedir=xorg-server-1.17.2
wget  http://ftp.x.org/pub/individual/xserver/$package
tar -xf $package
pushd $packagedir
./configure $XORG_CONFIG            \
           --enable-glamor          \
           --enable-install-setuid  \
           --enable-suid-wrapper    \
           --disable-systemd-logind \
           --with-xkb-output=$HOME/lib/Xorg/var/lib/xkb &&

make && make install
popd
rm -rf $packagedir
rm $package

mkdir -pv $HOME/lib/Xorg/etc/X11/xorg.conf.d &&
cat >> $HOME/lib/Xorg/etc/sysconfig/createfiles << "EOF"
/tmp/.ICE-unix dir 1777 ${username} ${groupname}
/tmp/.X11-unix dir 1777 ${username} ${groupname}
EOF
