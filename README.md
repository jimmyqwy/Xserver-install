## Xserver-install
Installation about Xorg Server  
Reference:  
http://www.linuxfromscratch.org/blfs/view/svn/x/xorg7.html  
http://www.linuxfromscratch.org/blfs/view/svn/x/xorg-server.html  

## Notes
* Need gcc/g++/llvm/clang toolchains
* Some source files need to be changed because the LLVM version is higher and
  its API is changed.
  * gallivm/lp_bld_debug.cpp
  * gallivm/lp_bld_misc.cpp
* llvm need to be recompiled with RTTI
  cmake -DCMAKE_C_COMPILER=${HOST_GCC}/bin/gcc
  -DCMAKE_CXX_COMPILER=${HOST_GCC}/bin/g++ -DGCC_INSTALL_PREFIX=${HOST_GCC}
  -DCMAKE_CXX_LINK_FLAGS="-L${HOST_GCC}/lib64 -Wl,-rpath,${HOST_GCC}/lib64"
  -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} -DLLVM_ENABLE_ASSERTIONS=ON
  -DCMAKE_BUILD_TYPE="Release" -DLLVM_TARGETS_TO_BUILD="X86"
  -DBUILD_SHARED_LIBS=ON -DLLVM_ENABLE_RTTI=1 ../llvm
* Use the scripts from 00 to 21 to install Xorg Server step by step. (From
  scratch)
* 15-0.libacl.sh => Dont forget set INSTALL_USER / INSTALL_GROUP
* 21.Xserver.sh => /tmp/.ICE-unix + /tmp/.X11-unix => change user and group
 
## Example
Use Xvfb for headless eclim plugin for VIM.
####  Start
- install essential
```  
$ sudo apt-get install openjdk-6-jdk xvfb build-essential => or build from scratch  
```
- install eclipse  
- install eclim  
```
$ java \
  -Dvim.files=$HOME/.vim \
  -Declipse.home=/opt/eclipse \
  -jar eclim_2.4.1.jar install
```
- start a virtual display  
```
$ Xvfb :1 -screen 0 1024x768x24 &
$ DISPLAY=:1 ./eclipse/eclimd -b
````

#### Usage
- :JavaImport  
- :JavaImportOrganize (All)  

#### End
- in VIM :ShutdownEclim  
- kill Xvfb



