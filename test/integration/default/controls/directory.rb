# frozen_string_literal: true

control 'Directory' do
  title 'should should be configured'
  
  # Media directory
  describe directory('/mnt') do
    its('owner') { should eq 'media' }
    its('group') { should eq 'media' }
    its('mode') { should cmp '0650' }
  end

  # Sonarr directory
  describe directory('/etc/nzbget') do
    its('owner') { should eq 'media' }
    its('group') { should eq 'media' }
    its('mode') { should cmp '0650' }
  end

  # Sonarr directory
  describe directory('/etc/sonarr') do
    its('owner') { should eq 'media' }
    its('group') { should eq 'media' }
    its('mode') { should cmp '0650' }
  end

  # Radarr directory
  describe directory('/etc/radarr') do
    its('owner') { should eq 'media' }
    its('group') { should eq 'media' }
    its('mode') { should cmp '0650' }
  end

  # Resilio Sync directory
  describe directory('/etc/sync') do
    its('owner') { should eq 'media' }
    its('group') { should eq 'media' }
    its('mode') { should cmp '0650' }
  end

  # Plex directory
  describe directory('/etc/plex') do
    its('owner') { should eq 'media' }
    its('group') { should eq 'media' }
    its('mode') { should cmp '0650' }
  end
end