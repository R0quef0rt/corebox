# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "generic/ubuntu1804"
  config.vm.hostname = "sandbox"

  config.vm.provider "hyperv" do |vb|
    vb.memory = "2048"
    vb.maxmemory = "4096"
    vb.cpus = 1
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = 1
  end

  config.vm.provision :salt do |salt|
    salt.masterless = true
    salt.minion_id = "sandbox"
    salt.minion_config = "etc/salt/minion"
    salt.install_type = "stable"
    salt.bootstrap_options = "-F -P -p python-git"
    salt.salt_call_args = ["saltenv=qa", "pillarenv=qa"]
    salt.run_highstate = true
    salt.colorize = true
    salt.verbose = true
  end
end