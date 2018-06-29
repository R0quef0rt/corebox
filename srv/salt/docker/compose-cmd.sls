compose-project:
  git.latest:
    - name: https://github.com/R0quef0rt/devbox
    - rev: dev
    - target: /app/src
    - force_checkout: True
    - force_clone: True
    - force_fetch: True
    - force_reset: True
    - depth: 1

cmd-docker-compose-up:
  cmd.run:
    - name: 'docker-compose -f /app/src/docker-compose.yml up -f /app/src/docker-compose.{{saltenv}}.yml -d'
    - require:
      - pip: compose
      - git: compose-project