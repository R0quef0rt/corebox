# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "main" do |mn|
    mn.vm.box = "sandbox"
  end

  config.vm.box = "r0quef0rt/ubuntu"
  config.vm.box_url = "file://boxes.json"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = 2
  end

  config.vm.provider "hyperv" do |hv|
    hv.memory = "4096"
    hv.maxmemory = "8192"
    hv.cpus = 2
  end

  config.vm.synced_folder ".", "/app/live"

  config.vm.provision :salt do |salt|
    salt.masterless = true
    salt.minion_id = "houston"
    salt.minion_config = "etc/salt/minion"
    salt.install_type = "stable"
    salt.bootstrap_options = "-F -P -p python-git"
    salt.salt_call_args = ["saltenv=dev", "pillarenv=dev"]
    salt.run_highstate = true
    salt.colorize = true
    salt.verbose = false
  end
end