# frozen_string_literal: true

control 'Docker configuration' do
  title 'should match desired lines'

  describe file('/etc/default/docker') do
    it { should be_file }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
    its('mode')  { should cmp '0644' }
    # its('content') { should include 'DOCKER_OPTS="-s btrfs --dns 8.8.8.8"' }
    # its('content') { should include 'export http_proxy="http://172.17.42.1:3128"' }
  end
end

control 'Docker package' do
  title 'should be installed'

  package_name =
    case platform[:family]
    when 'debian'
      'docker-ce'
    # Catch remaining `linux` platforms to identify by `name` at the end
    when 'linux'
      case platform[:name]
      when 'arch'
        'docker'
      end
    end

  describe package(package_name) do
    it { should be_installed }
  end
end

control 'Docker service' do
  title 'should be running and enabled'

  describe service('docker') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
end

control 'Docker containers' do
  title 'should be running and enabled'

  describe docker.containers do
    its('images') { should include 'duplicati/duplicati:2.0.5.104_canary_2020-03-25' }
    its('images') { should include 'linuxserver/nzbget:125' }
    its('images') { should include 'plexinc/pms-docker:1.13.5.5332-21ab172de' }
    its('images') { should include 'linuxserver/radarr:116' }
    its('images') { should include 'linuxserver/sonarr:143' }
    its('images') { should include 'resilio/sync:release-2.5.13' }
  end

  docker.containers.running?.ids.each do |id|
    describe docker.object(id), :sensitive do
      its('State.Status') { should eq 'running' }
    end
  end
end

control 'Docker containers permissions' do
  title 'should be limited'

  docker.containers.ids.each do |id|
    describe docker.object(id) do
      its(%w(HostConfig Privileged)) { should cmp false }
      its(%w(HostConfig Privileged)) { should_not cmp true }
    end
  end
end