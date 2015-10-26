# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "debian/jessie64"
  config.vm.box_check_update = true
  config.vm.communicator = "ssh"
  config.vm.boot_timeout = 300
  config.vm.graceful_halt_timeout = 60
#  config.vm.guest = "linux"
  config.vm.hostname = "DL-dev"
  config.vm.network :public_network, bridge: "eth0"
  config.vm.provision :shell, path: "provision.sh"
  config.ssh.username = "vagrant"
  config.ssh.password = File.read("vagrant-ssh.pswd")
  config.ssh.forward_agent = true

#  config.vm.synced_folder "../../../", "/vagrant/project"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = 1024
    vb.cpus = 2
  end
end
