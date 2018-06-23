cmd-docker-compose-up:
  cmd.run:
    - name: 'docker-compose -f /tmp/seedbox/docker-compose.yml -f /tmp/seedbox/docker-compose.dev.yml up -d'
    # - require:
    #   - service: docker-compose