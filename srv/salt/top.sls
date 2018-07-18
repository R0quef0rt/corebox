dev:
  '*':
    - common
    - system
    - docker
    - docker.compose
    - traefik
    - hugo
    - prometheus
    - docker.compose-cli.build
    - docker.compose-cli.up
    - grafana
qa:
  '*':
    - common
    - system
    - system.repo
    - docker
    - docker.compose
  'cloudbox':
    - traefik
    - hugo
    - docker.compose-cli.build
    - docker.compose-cli.up
  'devbox':
    - system.raid
prod:
  '*':
    - common
    - system
    - system.repo
    - docker
    - docker.compose
    - traefik
    - hugo
    - docker.compose-cli.build
    - docker.compose-cli.up
  'devbox':
    - system.raid