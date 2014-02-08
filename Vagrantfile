VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = 'ubuntu-raring-64'
  config.vm.box_url = 'https://cloud-images.ubuntu.com/vagrant/saucy/20140205/saucy-server-cloudimg-amd64-vagrant-disk1.box'
  config.vm.provision 'shell', :privileged => false, :path => 'provision.sh'
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.provider :virtualbox do |v|
    v.customize ['modifyvm', :id, '--memory', '1024']
    v.customize ['modifyvm', :id, '--cpus', 4]
  end

end
