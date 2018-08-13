# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box_check_update = true
  config.vm.box = "ldap"
  config.vm.box_url = "./output/artifacts/server2016-0.4.0-virtualbox.box"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = 2
  end

  config.vm.provider "hyperv" do |vb|
    vb.vmname = "ldap"
    vb.memory = "4096"
    vb.maxmemory = "8192"
    vb.cpus = 2
  end
  
  config.vm.guest = :windows
  config.vm.communicator = "winrm"
  config.winrm.username = "Administrator"
  config.winrm.password = "cdi@2468"

  config.vm.provision "file", source: "./srv/salt", destination: "C:\\app\\live\\srv\\salt"
  config.vm.provision "file", source: "./srv/pillar", destination: "C:\\app\\live\\srv\\pillar"

  config.vm.provision :salt do |salt|
    salt.masterless = true
    salt.minion_id = "winbox"
    salt.minion_config = "etc/salt/minion.windows"
    salt.bootstrap_options = "-U -pythonVersion 3"
    salt.version = "2018.3.2"
    salt.salt_call_args = ["saltenv=dev", "pillarenv=dev"]
    salt.run_highstate = true
    salt.colorize = true
    salt.verbose = false
  end
end