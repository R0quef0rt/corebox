dev:
  '*':
    - common
    - system
    - docker
    - docker.compose
    - traefik
    - elasticsearch
    - prometheus
    - grafana
    - hugo
    - filebeat
    - docker.compose-cli.build
    - docker.compose-cli.up
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
    - elasticsearch
    - prometheus
    - grafana
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
    - elasticsearch
    - prometheus
    - grafana
    - docker.compose-cli.build
    - docker.compose-cli.up
  'devbox':
    - system.raid