#!/bin/sh

# let's install packages
sudo apt-get update
sudo apt-get upgrade
sudo apt-get -y install build-essential libgmp-dev libgmp3-dev libcrypto++-dev git automake libtool libleveldb-dev yasm unzip libminiupnpc-dev
sudo apt-get -y install libboost1.53-all-dev
sudo apt-get -y install qtbase5-dev qt5-default qt5-qmake
sudo apt-get -y install cmake cmake-curses-gui # cmake-curses-gui might be useful for developers

# create directories structure
[ ! -d "ethereum" ] && mkdir ethereum # ethereum dir maybe mapped from host machine
mkdir opt
mkdir bin
mkdir logs

# download cpp-ethereum if needed
cd ethereum
[ ! -d "cpp-ethereum" ] && git clone https://github.com/ethereum/cpp-ethereum

# download and build ethereum's dependencies
cd ~/opt
if [ ! -d "cryptopp562" ]; then
  mkdir cryptopp562
  cd cryptopp562
  wget http://www.cryptopp.com/cryptopp562.zip
  unzip cryptopp562.zip
  CXX="g++ -fPIC" make
  make dynamic
  sudo make install
fi

#wget http://gavwood.com/secp256k1.tar.bz2
#tar xjf secp256k1.tar.bz2
#cd secp256k1
#./configure && make
#sudo cp ~/opt/secp256k1/libsecp256k1.so /usr/lib/
#cd ..

# build ethereum
cd ~/opt
mkdir cpp-ethereum-build
cd cpp-ethereum-build
cmake ~/ethereum/cpp-ethereum -DCMAKE_BUILD_TYPE=Debug
make

# build alethzero GUI client
mkdir alethzero
cd alethzero
qmake ~/ethereum/cpp-ethereum/alethzero
make

# now let's create bin folder in user's home dir and create symlinks to executables
cd ~
ln -s ~/opt/cpp-ethereum-build/alethzero/alethzero ~/bin/alethzero
ln -s ~/opt/cpp-ethereum-build/eth/eth ~/bin/eth

# Configure a Server

cd bin
cat > serv.sh << EOF
#!/bin/bash

while [ 1 ]; do
  HOME=/home/vagrant sudo -u vagrant /home/vagrant/bin/eth -o peer -x 256 -l 30303 -m off -v 1 > /home/vagrant/logs/eth.log
  mv /home/vagrant/logs/eth.log /home/vagrant/logs/eth.log-\$(date +%F_%T)
done
EOF
chmod +x serv.sh

# if you want the server to start automatically on system boot, edit rc.local and insert:
# /home/vagrant/bin/serv.sh &
