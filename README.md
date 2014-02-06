# Vagrant Ethereum

Creates development environment based on Ubunt 13.04 to compile and run Ethereum client using Vagrant and VirtualBox.


## Installation

Install VirtualBox, see https://www.virtualbox.org for details.

Install Vagrant, see http://www.vagrantup.com for details.

Clone this project and run vagrant:

    $ git clone https://github.com/valzav/vagrant-ethereum.git

    $ cd vagrant-ethereum

    $ vagrant up

## Usage

Connect to vagrant VM:

    $ vagrant ssh

Run command line Ethereum client (more info https://github.com/ethereum/cpp-ethereum/wiki/Using-Ethereum-CLI-Client)

    $ bin/eth

Or run AlephZero - Ethereum graphical client (more info https://github.com/ethereum/cpp-ethereum/wiki/Using-AlephZero)

    $ bin/alephzero

Note: AlephZero requires X server to be running on your host machine. I recommend XQuartz if you are using OS X.

