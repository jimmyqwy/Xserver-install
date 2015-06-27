#!/bin/bash

# path
source $HOME/src/Xorg/0.xorg_env.sh

wget http://ftp.x.org/pub/individual/lib/libXau-1.0.8.tar.gz
tar -zxvf libXau-1.0.8.tar.gz
cd libXau-1.0.8
./configure $XORG_CONFIG
make && make install
cd ..
rm libXau-1.0.8.tar.gz
rm -rf libXau-1.0.8
