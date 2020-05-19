# frozen_string_literal: true

control 'Firewall' do
  title 'should should be listening'
  
  # SSH
  ssh_protocols = [
    "tcp",
    "tcp6"
  ]
  describe port(22) do
    it { should be_listening }
    its('protocols') { should be_in ssh_protocols }
  end

  # Duplicati
  describe port(8200) do
    it { should be_listening }
    its('protocols') { should cmp 'tcp' }
  end

  # Plex
  describe port(32400) do
    it { should be_listening }
    its('protocols') { should cmp 'tcp' }
  end

  # Radarr
  describe port(7878) do
    it { should be_listening }
    its('protocols') { should cmp 'tcp' }
  end

  # Sonarr
  describe port(8989) do
    it { should be_listening }
    its('protocols') { should cmp 'tcp' }
  end

  # Resilio Sync
  describe port(8888) do
    it { should be_listening }
    its('protocols') { should cmp 'tcp' }
  end

  describe port(55555) do
    it { should be_listening }
    its('protocols') { should cmp 'tcp' }
  end
end