# frozen_string_literal: true

control 'Directory' do
  title 'should should be configured'

  # NZBGet
  describe file('/etc/nzbget/nzbget.conf') do
    it { should exist }
  end

  # Duplicati
  describe file('/etc/duplicati/Duplicati/Duplicati-server.sqlite') do
    it { should exist }
  end

  # Sonarr
  describe file('/etc/sonarr/config.xml') do
    it { should exist }
  end

  # Radarr
  describe file('/etc/radarr/config.xml') do
    it { should exist }
  end

  # Resilio Sync
  describe file('/etc/sync/sync.conf') do
    it { should exist }
  end

  # Plex
  describe file('/etc/plex/Library/Application Support/Plex Media Server/Preferences.xml') do
    it { should exist }
  end
end