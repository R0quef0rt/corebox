cmd-docker-compose-up:
  cmd.run:
    - name: 'docker-compose -f /app/docker-compose.yml -f /app/docker-compose.dev.yml up -d'
    - require:
      - pip: compose