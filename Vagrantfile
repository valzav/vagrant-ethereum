VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = 'ubuntu-raring-64'
  config.vm.box_url = 'https://cloud-images.ubuntu.com/vagrant/saucy/current/saucy-server-cloudimg-amd64-vagrant-disk1.box'
  config.vm.provision 'shell', :privileged => false, :path => 'provision.sh'
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true
  if ENV['ETHEREUM_DEV_DIR']
    ethereum_dir = ENV['ETHEREUM_DEV_DIR']
    puts "WARNING! it will attempt to mount #{ethereum_dir} dir to guest's filesystem"
    puts "         this may require the latest version of quest additions"
    config.vm.synced_folder ethereum_dir, '/home/vagrant/ethereum'
  end

  config.vm.provider :virtualbox do |v|
    v.customize ['modifyvm', :id, '--memory', '1024']
    v.customize ['modifyvm', :id, '--cpus', 4]
  end

end
