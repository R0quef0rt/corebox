docker-compose-pull:
  cmd.run:
    - name: 'docker-compose -f docker-compose.yml -f docker-compose.{{saltenv}}.yml pull'
    - cwd: /app/live

docker-compose-up:
  cmd.run:
    - name: 'docker-compose -f docker-compose.yml -f docker-compose.{{saltenv}}.yml up --no-build -d'
    - cwd: /app/live
    - require:
      - cmd: docker-compose-pull