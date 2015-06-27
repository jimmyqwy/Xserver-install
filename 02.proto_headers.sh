#!/bin/bash

source $HOME/src/Xorg/0.xorg_env.sh

# Download
rm -rf proto
mkdir proto &&
cd proto &&
grep -v '^#' ../proto-7.7.md5 | awk '{print $2}' | wget -i- -c \
    -B http://ftp.x.org/pub/individual/proto/ &&
md5sum -c ../proto-7.7.md5


# Install
cd $HOME/src/Xorg/proto
for package in $(grep -v '^#' ../proto-7.7.md5 | awk '{print $2}')
do
  packagedir=${package%.tar.bz2}
  tar -xf $package
  pushd $packagedir
  ./configure $XORG_CONFIG
  make install
  popd
  rm -rf $packagedir
done
