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
    hv.cpus = 2
    hv.linked_clone = true
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = 2
  end

  config.vm.synced_folder ".", "/app"

  # Fixes a bug in the libssl package that causes salt install to hang indefinitely
  config.vm.provision "shell", type: "shell", run: "always" do |s|
    s.inline = <<~SHELL
      apt-get update
      dpkg-reconfigure libc6 
      DEBIAN_FRONTEND=noninteractive dpkg --configure libssl1.1 
      DEBIAN_FRONTEND=noninteractive apt-get install -y libssl1.1 python3-pip
      python3 -m pip install gitpython
    SHELL
  end

  config.vm.provision :salt do |salt|
    salt.masterless = true
    salt.minion_id = "devbox"
    salt.minion_config = "./etc/salt/minion.dev"
    salt.grains_config = "./etc/salt/grains.dev"
    salt.install_type = "git v3000.2"
    salt.bootstrap_options = "-F -P -V -a -x python3 -p gitpython"
    salt.salt_call_args = ["saltenv=dev", "pillarenv=dev"]
    salt.run_highstate = true
    salt.colorize = true
    salt.verbose = true
  end
end