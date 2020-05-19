# frozen_string_literal: true

control 'Web pages' do
  title 'should be online and responding'

  # NZBGet
  describe http('http://localhost:6789',
                auth: {user: 'nzbget', pass: 'tegbzn6789'}) do
    its('status') { should cmp 200 }
  end

  # Duplicati
  describe http('http://localhost:8200') do
    its('status') { should cmp 200 }
  end

  # Plex
  describe http('http://localhost:32400') do
    its('status') { should cmp 200 }
  end

  # Radarr
  describe http('http://localhost:7878') do
    its('status') { should cmp 200 }
  end

  # Sonarr
  describe http('http://localhost:8989') do
    its('status') { should cmp 200 }
  end

  # Resilio Sync
  describe http('http://localhost:8888/gui/') do
    its('status') { should cmp 200 }
  end
end