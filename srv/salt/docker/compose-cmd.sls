compose-project:
  git.latest:
    - name: https://github.com/R0quef0rt/devbox
    - rev: {{saltenv}}
    - target: /app/live
    - force_checkout: True
    - force_clone: True
    - force_fetch: True
    - force_reset: True
    - depth: 1

cmd-docker-compose-up:
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