# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.
  
  config.vm.hostname = "archivematica"

  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 3072
    vb.cpus = 2
    config.vm.network "private_network", ip: "192.168.42.3"    
  end

  # sets shared dir that is passed to bootstrap
  shared_dir = "/vagrant"  

  config.vm.provision "shell", path: "./install_scripts/bootstrap.sh", args: shared_dir
  config.vm.provision "shell", path: "./install_scripts/storage_setup.sh", privileged: false, args: shared_dir
  config.vm.provision "shell", path: "./install_scripts/archivematica.sh", args: shared_dir

end
