# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "generic/ubuntu1604"
  config.vm.hostname = "seedbox"

  config.vm.provider "hyperv" do |vb|
    vb.memory = "2048"
    vb.cpus = 1
  end

  config.vm.synced_folder "./srv/salt/states", "/srv/salt"
  config.vm.synced_folder "./srv/salt/pillars", "/srv/pillar"

  config.vm.provision :salt do |salt|
    salt.minion_config = "srv/salt/minion"
    salt.install_type = "stable"
    salt.verbose = true
    salt.colorize = true
    salt.bootstrap_options = "-P -c /tmp"
    salt.run_highstate = true
    salt.salt_call_args = ["saltenv=dev", "pillarenv=dev"]
  end

  config.vm.provision "shell", run: "once" do |compose|
    compose.inline = <<-SHELL
      sudo salt-call --local dockercompose.up /vagrant
    SHELL
  end
end