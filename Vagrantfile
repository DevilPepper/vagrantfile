# -*- mode: ruby -*-
# vi: set ft=ruby :

username="stuff"
dotfiles="https://github.com/SupaStuff/dotfiles.git --branch=dev"
dockerfiles="https://github.com/SupaStuff/dockerfiles.git"
TZ="America/New_York"

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
  config.vm.box = "bento/debian-9.4"
  config.vm.box_version = "201803.24.0"

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
  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
      vb.gui = true
      vb.name = "bento.debian-9.4"
  #
  #   # Customize the amount of memory on the VM:
      vb.memory = "4096"

      #Virtualbox settings
      vb.customize ["modifyvm", :id, "--vram", 64]
      vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
      vb.customize ["modifyvm", :id, "--accelerate2dvideo", "on"]
      vb.customize ["modifyvm", :id, "--audioin", "on"]
      vb.customize ["modifyvm", :id, "--audioout", "on"]
      vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
      vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]

  end

  # View the documentation for the provider you are using for more
  # information on available options.

  config.vm.provision "shell", path: "setup/apt-get.sh"
  config.vm.provision "shell", path: "setup/grub.sh"
  config.vm.provision "shell", path: "app/docker.sh"
  config.vm.provision "shell", path: "setup/user-config.sh",
                               :args => "#{username} '#{dotfiles}' '#{dockerfiles}' #{TZ}"
  config.vm.provision "shell", path: "setup/autostart_gsettings.sh"
  config.vm.provision "shell", path: "app/vbox.sh"

  #optional applications
  config.vm.provision "shell", path: "app/atom.sh"
  # config.vm.provision "shell", path: "app/vscode.sh"

  # for VirtualBox guest additions
  config.vm.provision "shell", inline: "echo 'Restarting... /vagrant will be empty'"
  config.vm.provision "shell", inline: "shutdown -r 0"

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
