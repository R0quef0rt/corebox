# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "generic/ubuntu1804"
  config.vm.hostname = "sandbox"

  config.vm.provider "hyperv" do |vb|
    vb.memory = "2048"
    vb.maxmemory = "8192"
    vb.cpus = 2
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = 2
  end

  config.vm.network "forwarded_port", guest: 80,  host: 80
  config.vm.network "forwarded_port", guest: 3000,  host: 3000
  config.vm.network "forwarded_port", guest: 9090,  host: 9090
  config.vm.network "forwarded_port", guest: 9093,  host: 9093
  config.vm.network "forwarded_port", guest: 9100,  host: 9100
  config.vm.network "forwarded_port", guest: 6789,  host: 6789
  config.vm.network "forwarded_port", guest: 8989,  host: 8989
  config.vm.network "forwarded_port", guest: 7878,  host: 7878
  config.vm.network "forwarded_port", guest: 8888,  host: 8888
  config.vm.network "forwarded_port", guest: 8200,  host: 8200
  config.vm.network "forwarded_port", guest: 32400,  host: 32400

  config.vm.synced_folder ".", "/app/live"

  config.vm.provision :salt do |salt|
    salt.masterless = true
    salt.minion_id = "sandbox"
    salt.minion_config = "etc/salt/minion"
    salt.install_type = "stable"
    salt.bootstrap_options = "-F -P -p python-git"
    salt.salt_call_args = ["saltenv=dev", "pillarenv=dev"]
    salt.run_highstate = true
    salt.colorize = true
    salt.verbose = false
  end
end