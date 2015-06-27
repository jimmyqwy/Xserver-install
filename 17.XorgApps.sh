#!/bin/bash

source ~/.bashrc
source $HOME/src/Xorg/0.xorg_env.sh

# freetype
PKG_CONFIG_PATH=$HOME/lib/Xorg/lib/pkgconfig:$HOME/lib/freetype/lib/pkgconfig:$PKG_CONFIG_PATH
echo $PKG_CONFIG_PATH
#--disable-libudev
export LD_LIBRARY_PATH=/lib:/lib64:/usr/lib:/usr/lib64:$LD_LIBRARY_PATH

mkdir app &&
cd app &&
grep -v '^#' ../app-7.7.md5 | awk '{print $2}' | wget -i- -c \
     -B http://ftp.x.org/pub/individual/app/ &&
md5sum -c ../app-7.7.md5

# Install
cd $HOME/src/Xorg/app
for package in $(grep -v '^#' ../app-7.7.md5 | awk '{print $2}')
do
  packagedir=${package%.tar.bz2}
  tar -xf $package
  pushd $packagedir
  case $packagedir in
    luit-[0-9]* )
      line1="#ifdef _XOPEN_SOURCE"
      line2="#  undef _XOPEN_SOURCE"
      line3="#  define _XOPEN_SOURCE 600"
      line4="#endif"

      sed -i -e "s@#ifdef HAVE_CONFIG_H@$line1\n$line2\n$line3\n$line4\n\n&@" sys.c
      unset line1 line2 line3 line4
    ;;
    sessreg-* )
      sed -e 's/\$(CPP) \$(DEFS)/$(CPP) -P $(DEFS)/' -i man/Makefile.in
    ;;
  esac
  ./configure $XORG_CONFIG
  make
  make install
  popd
  rm -rf $packagedir
done
