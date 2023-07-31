#!/bin/sh

cd $HOME/local/src
wget -nc https://www.openssl.org/source/openssl-1.0.2b.tar.gz
tar zxf openssl-1.0.2b.tar.gz

wget -nc http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.2.tar.gz
tar zxf ruby-2.2.2.tar.gz

wget -nc http://zlib.net/zlib-1.2.8.tar.gz
tar zxf zlib-1.2.8.tar.gz

wget -nc http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.14.tar.gz
tar zxf libiconv-1.14.tar.gz

wget -nc http://xmlsoft.org/sources/libxml2-2.9.2.tar.gz
tar zxf libxml2-2.9.2.tar.gz

cd openssl-1.0.2b
./config --prefix=$HOME/local shared
make
make install

cd ../zlib-1.2.8
./configure --prefix=$HOME/local --shared --libdir=$HOME/local/lib
make
make install

cd ../libxml2-2.9.2
./configure --prefix=$HOME/local --disable-static --with-history --with-python=no
make
make install

cd ../ruby-2.2.2
./configure --prefix=$HOME/local --with-opt-dir=$HOME/local --enable-shared
make
make install

echo PATH=$HOME/local/bin:$PATH >> ~/.bash_profile

source ~/.bash_profile
