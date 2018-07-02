docker-compose-up:
  cmd.run:
    {% if saltenv == 'dev' %}
    - name: 'docker-compose -f /app/dev/docker-compose.yml -f /app/dev/docker-compose.dev.yml up -d'
    - require:
      - pip: compose
      - git: compose-project
    {% elif saltenv == 'qa' or 'prod' %}
    - name: 'docker-compose -f /app/live/docker-compose.yml -f /app/live/docker-compose.prod.yml up -d'
    - require:
      - pip: compose
      - git: compose-project
    {% endif %}