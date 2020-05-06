docker-compose-pull:
  cmd.run:
    - name: 'docker-compose -f docker-compose.yml -f docker-compose.{{saltenv}}.yml pull'
    - cwd: /app

docker-compose-up:
  cmd.run:
    - name: 'docker-compose -f docker-compose.yml -f docker-compose.{{saltenv}}.yml up --no-build --force-recreate --remove-orphans -d'
    - cwd: /app
    - require:
      - cmd: docker-compose-pull