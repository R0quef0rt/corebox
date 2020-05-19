# frozen_string_literal: true

control 'Directory' do
  title 'should should be configured'
  
  # Media
  describe directory('/mnt') do
    its('owner') { should eq 'media' }
    its('group') { should eq 'media' }
    its('mode') { should cmp '0650' }
  end

  # Project git repo
  describe directory('/app') do
    it { should exist }
  end

  # Sonarr
  describe directory('/etc/nzbget') do
    its('owner') { should eq 'media' }
    its('group') { should eq 'media' }
    its('mode') { should cmp '0750' }
  end

  # Sonarr
  describe directory('/etc/sonarr') do
    its('owner') { should eq 'media' }
    its('group') { should eq 'media' }
    its('mode') { should cmp '0750' }
  end

  # Radarr
  describe directory('/etc/radarr') do
    its('owner') { should eq 'media' }
    its('group') { should eq 'media' }
    its('mode') { should cmp '0750' }
  end

  # Resilio Sync
  describe directory('/etc/sync') do
    its('owner') { should eq 'media' }
    its('group') { should eq 'media' }
    its('mode') { should cmp '0650' }
  end

  # Plex
  describe directory('/etc/plex') do
    its('owner') { should eq 'media' }
    its('group') { should eq 'media' }
    its('mode') { should cmp '0750' }
  end
end