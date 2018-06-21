# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "generic/ubuntu1804"
  config.vm.hostname = "seedbox"

  config.vm.provider "hyperv" do |vb|
    vb.memory = "2048"
    vb.cpus = 1
  end

  config.vm.synced_folder "./srv/salt/salt", "/srv/salt"
  config.vm.synced_folder "./srv/salt/pillar", "/srv/pillar"

  config.vm.provision :salt do |salt|
    salt.masterless = true
    salt.minion_config = "srv/salt/minion"
    salt.install_type = "stable"
    salt.verbose = false
    salt.colorize = true
    salt.bootstrap_options = "-P -c /tmp"
    salt.run_highstate = true
    salt.salt_call_args = ["saltenv=dev", "pillarenv=dev"]
  end

  config.vm.provision "file", source: "docker-compose.yml", destination: "/tmp/docker-compose.yml"

  config.vm.provision "shell" do |compose|
    compose.inline = <<-SHELL
      salt-call --local dockercompose.up /tmp/docker-compose.yml
    SHELL
  end
end