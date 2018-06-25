# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "generic/ubuntu1804"
  config.vm.hostname = "sandbox"

  config.vm.provider "hyperv" do |vb|
    vb.memory = "2048"
    vb.cpus = 1
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = 1
  end

  config.vm.network "forwarded_port", guest: 6789,  host: 6789   # NZBGet
  config.vm.network "forwarded_port", guest: 8989,  host: 8989   # Sonarr
  config.vm.network "forwarded_port", guest: 7878,  host: 7878   # Radarr
  config.vm.network "forwarded_port", guest: 18200, host: 18200 # Duplicati
  config.vm.network "forwarded_port", guest: 18888, host: 18888 # Resilio Sync
  config.vm.network "forwarded_port", guest: 32400, host: 32400 # Plex

  config.vm.synced_folder "./srv/salt", "/srv/salt"
  config.vm.synced_folder "./srv/pillar", "/srv/pillar"
  config.vm.synced_folder "./etc/nzbget", "/etc/nzbget"
  config.vm.synced_folder "./etc/sonarr", "/etc/sonarr"
  config.vm.synced_folder "./etc/radarr", "/etc/radarr"
  config.vm.synced_folder "./etc/plex", "/etc/plex"
  config.vm.synced_folder "./etc/duplicati", "/etc/duplicati"
  config.vm.synced_folder ".", "/app"

  config.vm.provision :salt do |salt|
    salt.masterless = true
    salt.minion_id = "sandbox"
    salt.minion_config = "etc/salt/minion"
    salt.install_type = "stable"
    salt.bootstrap_options = "-F -P -p python-git"
    salt.salt_call_args = ["saltenv=dev", "pillarenv=dev"]
    salt.run_highstate = true
    salt.colorize = true
    salt.verbose = true
  end
end