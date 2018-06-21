# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "generic/ubuntu1804"
  config.vm.hostname = "seedbox"

  config.vm.provider "hyperv" do |vb|
    vb.memory = "2048"
    vb.cpus = 1
  end

  config.vm.network "forwarded_port", guest: 8989, host: 8989
  config.vm.network "forwarded_port", guest: 6789, host: 6789
  config.vm.network "forwarded_port", guest: 8200, host: 8200
  config.vm.network "forwarded_port", guest: 8888, host: 8888
  config.vm.network "forwarded_port", guest: 55555, host: 55555
  config.vm.network "forwarded_port", guest: 32400, host: 32400

  config.vm.synced_folder "./srv/salt/salt", "/srv/salt"
  config.vm.synced_folder "./srv/salt/pillar", "/srv/pillar"

  config.vm.provision :salt do |salt|
    salt.masterless = true
    salt.minion_config = "srv/salt/minion"
    salt.install_type = "stable"
    salt.bootstrap_options = "-P -c /tmp"
    salt.salt_call_args = ["saltenv=dev", "pillarenv=dev"]
    salt.run_highstate = true
    salt.colorize = true
    salt.verbose = false
  end

  config.vm.provision "file", source: "docker-compose.yml", destination: "/tmp/docker-compose.yml"

  config.vm.provision "shell" do |compose|
    compose.inline = <<-SHELL
      salt-call --local dockercompose.up /tmp/docker-compose.yml
    SHELL
  end
end