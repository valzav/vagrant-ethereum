# Vagrant Ethereum

Creates development environment based on Ubunt 13.10 to compile and run Ethereum client using Vagrant and VirtualBox.


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

    $ bin/alethzero

Please note that alethzero is a graphical client and requires X Server for its work, this setup uses Ubuntu Server which doesn't include any GUI,
but you may use X Server installed on your host machine:

- On OS X just install XQuartz, connect to ehtereum guest VM via "vagrant ssh" command and run "bin/alethzero"

- On Windows hosts you would need Xming X Server (http://sourceforge.net/projects/xming/) and PuTTY SSH client (http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html).
  After you install Xming and PuTTY you need to configure PuTTY to access guest VM, type "vagrant ssh-config", note where private key located,
  use PuTTYgen to convert it into PuTTY format, connect to VM via PuTTY, run bin/alethzero - it should open in Xming.
