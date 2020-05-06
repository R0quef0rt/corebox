# frozen_string_literal: true

control 'Directory' do
  title 'should should be configured'

  # NZBGet config
  describe file('/etc/nzbget/nzbget.conf') do
    it { should exist }
  end
end