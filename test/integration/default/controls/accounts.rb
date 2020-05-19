# frozen_string_literal: true

control 'Accounts' do
  title 'should be configured'

  # Master user
  describe user('master') do
    it { should exist }
    its('uid') { should eq 1050 }
    its('gid') { should eq 1050 }
    its('groups') { should be_in ['docker', 'sudo', 'adm', 'master']}
  end

  # Media user
  describe user('media') do
    it { should exist }
    its('uid') { should eq 7000 }
    its('gid') { should eq 7000 }
  end
end