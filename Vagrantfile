# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
#  config.vm.box = "shekeriev/debian-11"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.57.10"
 # config.vm.network "private_network", type: "dhcp"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
#  config.vm.network "public_network", bridge: "enp1s0", ip: "192.168.0.230"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "./data", "/var/config", owner: "root", group: "root"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
#  config.vm.provider "virtualbox" do |vb|
#    vb.gui = true
#    vb.memory = "1024"
#    vb.cpus = 2
#    vb.name = 'debiandevops'
#  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  config.vm.define "puppet" do |puppet|
	puppet.vm.box = "shekeriev/debian-11"
	puppet.vm.hostname = "puppet"
	puppet.vm.provider "virtualbox" do |vb|
	  vb.name = "puppet"
	  vb.memory = "512"
	  vb.cpus = 2
       	end
	puppet.vm.provision "shell", path: "script.sh"
	puppet.vm.provision "puppet" do |puppet|
		puppet.manifests_path = "manifests"
		puppet.module_path = "modules"
		puppet.manifest_file = "install.pp"
	end
  end
  config.vm.define "ansible" do |ansible|
        ansible.vm.box = "shekeriev/debian-11"
 	ansible.vm.hostname = "ansible"
	ansible.vm.provider "virtualbox" do |vb|
	  	vb.name = "ansible"
 	  	vb.memory = "512"
	  	vb.cpus = 2
        end
   	ansible.vm.provision "ansible_local" do |ansible|
    		ansible.playbook = "playbook.yml"
		ansible.install_mode = "pip"
  	end
  end


  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y vim ansible
  # SHELL
end
