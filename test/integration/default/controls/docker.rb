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