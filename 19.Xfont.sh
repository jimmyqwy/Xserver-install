#!/bin/bash

source ~/.bashrc
source $HOME/src/Xorg/0.xorg_env.sh

# freetype
PKG_CONFIG_PATH=$HOME/lib/Xorg/lib/pkgconfig:$HOME/lib/freetype/lib/pkgconfig:$PKG_CONFIG_PATH
echo $PKG_CONFIG_PATH
#--disable-libudev
export LD_LIBRARY_PATH=/lib:/lib64:/usr/lib:/usr/lib64:$LD_LIBRARY_PATH

mkdir font &&
cd font &&
grep -v '^#' ../font-7.7.md5 | awk '{print $2}' | wget -i- -c \
     -B http://ftp.x.org/pub/individual/font/ &&
md5sum -c ../font-7.7.md5

# Install
cd $HOME/src/Xorg/font
for package in $(grep -v '^#' ../font-7.7.md5 | awk '{print $2}')
do
  packagedir=${package%.tar.bz2}
  tar -xf $package
  pushd $packagedir
  ./configure $XORG_CONFIG
  make
  make install
  popd
  rm -rf $packagedir
done
