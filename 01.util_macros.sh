#!/bin/bash

# path
source $HOME/src/Xorg/0.xorg_env.sh

wget http://ftp.x.org/pub/individual/util/util-macros-1.19.0.tar.gz
tar -zxvf util-macros-1.19.0.tar.gz
cd util-macros-1.19.0
./configure $XORG_CONFIG
make && make install
cd ..
rm util-macros-1.19.0.tar.gz
rm -rf util-macros-1.19.0
