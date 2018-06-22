# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "generic/ubuntu1804"
  config.vm.hostname = "seedbox"

  config.vm.provider "hyperv" do |vb|
    vb.memory = "2048"
    vb.cpus = 1
  end

  config.vm.network "forwarded_port", guest: 6789, host: 6789
  config.vm.network "private_network", ip: "192.168.5.175"

  config.vm.synced_folder "./srv/salt", "/srv/salt"
  config.vm.synced_folder "./srv/pillar", "/srv/pillar"
  config.vm.synced_folder "./etc/nzbget", "/etc/nzbget"

  config.vm.provision :salt do |salt|
    salt.masterless = true
    salt.minion_config = "etc/salt/minion"
    salt.install_type = "stable"
    salt.bootstrap_options = "-F -U -P"
    salt.salt_call_args = ["saltenv=dev", "pillarenv=dev"]
    salt.run_highstate = true
    salt.colorize = true
    salt.verbose = true
  end

  # config.vm.provision "shell" do |compose|
  #   compose.inline = <<-SHELL
  #     salt-call --local dockercompose.up /srv/seedbox/docker-compose.yml
  #   SHELL
  # end
end