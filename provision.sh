#!/bin/sh
sudo apt-get update && apt-get upgrade
sudo apt-get -y install build-essential libgmp-dev libgmp3-dev libcrypto++-dev git cmake automake libtool libleveldb-dev yasm unzip libminiupnpc-dev
sudo apt-get -y install libboost1.53-all-dev
sudo apt-get -y install qtbase5-dev qt5-default qt5-qmake

mkdir builds
cd builds

mkdir cryptopp562
cd cryptopp562
wget http://www.cryptopp.com/cryptopp562.zip
unzip cryptopp562.zip
make
cd ..

wget http://gavwood.com/secp256k1.tar.bz2
tar xjf secp256k1.tar.bz2
cd secp256k1
./configure && make
sudo cp ~/builds/secp256k1/libsecp256k1.so /usr/lib/
cd ..

git clone https://github.com/ethereum/cpp-ethereum
mkdir cpp-ethereum-build
cd cpp-ethereum-build
cmake ../cpp-ethereum -DCMAKE_BUILD_TYPE=Release
make

mkdir alephzero
cd alephzero
qmake ../../cpp-ethereum/alephzero
make

cd ~
mkdir bin
ln -s ~/builds/cpp-ethereum-build/alephzero/alephzero ~/bin/alephzero
ln -s ~/builds/cpp-ethereum-build/eth/eth ~/bin/eth
