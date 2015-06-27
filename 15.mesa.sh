#!/bin/bash

# path
source $HOME/src/Xorg/0.xorg_env.sh

# freetype
PKG_CONFIG_PATH=$HOME/lib/Xorg/lib/pkgconfig:$HOME/lib/freetype/lib/pkgconfig:$PKG_CONFIG_PATH
echo $PKG_CONFIG_PATH
#--disable-libudev
export LD_LIBRARY_PATH=/lib:/lib64:/usr/lib:/usr/lib64:$LD_LIBRARY_PATH

package=mesa-10.5.8.tar.xz
packagedir=${package%.tar.xz}

pushd $packagedir
./configure CFLAGS='-O2' CXXFLAGS='-O2'    \
            $XORG_CONFIG                   \
            --prefix=$XORG_PREFIX          \
            --sysconfdir=$HOME/lib/Xorg/etc  \
            --enable-texture-float         \
            --enable-gles1                 \
            --enable-gles2                 \
            --enable-osmesa                \
            --enable-xa                    \
            --enable-gbm                   \
            --enable-glx-tls               \
            --with-egl-platforms="drm,x11" \
            --disable-llvm-shared-libs     \
            --with-dri-drivers=            \
            --disable-gallium-llvm
#\
#            --with-gallium-drivers="nouveau,svga,swrast"
 
make && make install
popd

rm -rf $packagedir
rm $package
