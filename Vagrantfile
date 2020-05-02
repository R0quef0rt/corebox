# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "main" do |mn|
    mn.vm.box = "ubuntu-18.04"
    mn.vm.box_url = "file://vagrant.json"
    mn.vm.network "public_network"
  end  

  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"

  config.vm.provider "hyperv" do |hv|
    hv.memory = "2048"
    hv.maxmemory = "4096"
    hv.cpus = 2
    hv.linked_clone = true
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = 2
  end

  config.vm.synced_folder ".", "/app/live"

  config.vm.provision :salt do |salt|
    salt.masterless = true
    salt.minion_id = "devbox"
    salt.minion_config = "./etc/salt/minion.linux"
    salt.grains_config = "./etc/salt/grains"
    salt.install_type = "stable"
    salt.bootstrap_options = "-F -P -p python-git"
    salt.salt_call_args = ["saltenv=dev", "pillarenv=dev"]
    salt.run_highstate = true
    salt.colorize = true
    salt.verbose = true
  end
end