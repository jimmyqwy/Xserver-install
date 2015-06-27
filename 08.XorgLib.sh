#!/bin/bash

source $HOME/src/Xorg/0.xorg_env.sh

mkdir lib &&
cd lib &&
grep -v '^#' ../lib-7.7.md5 | awk '{print $2}' | wget -i- -c \
     -B http://ftp.x.org/pub/individual/lib/ &&
md5sum -c ../lib-7.7.md5

# Install
cd $HOME/src/Xorg/lib
for package in $(grep -v '^#' ../lib-7.7.md5 | awk '{print $2}')
do
  packagedir=${package%.tar.bz2}
  tar -xf $package
  pushd $packagedir
  case $packagedir in
    libXfont-[0-9]* )
      ./configure $XORG_CONFIG --disable-devel-docs
    ;;
    libXt-[0-9]* )
      ./configure $XORG_CONFIG \
                  --with-appdefaultdir=$HOME/lib/Xorg/etc/X11/app-defaults
    ;;
    * )
      ./configure $XORG_CONFIG
    ;;
  esac
  make
  #make check 2>&1 | tee ../$packagedir-make_check.log
  make install
  popd
  rm -rf $packagedir
  # as_root /sbin/ldconfig
done
