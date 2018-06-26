compose-project:
  git.latest:
    - name: https://github.com/R0quef0rt/devbox
    - rev: {{saltenv}}
    - target: /app/src
    # - bare: True
    - force_checkout: True
    - force_clone: True
    - force_fetch: True
    - force_reset: True
    - depth: 1

# cmd-docker-compose-up:
#   cmd.run:
#     - name: 'docker-compose -f /app/src/docker-compose.yml -f /app/src/docker-compose.{{saltenv}}.yml up -d'
#     - require:
#       - pip: compose
#       - git: compose-project