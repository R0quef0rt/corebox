dev:
  '*':
    - common
    - system
    - docker
    - docker.compose
    - hugo
    - docker.compose-cli.build
    - docker.compose-cli.up
qa:
  '*':
    - common
    - system
    - docker
    - docker.compose
    - hugo
    - docker.compose-cli.build
    - docker.compose-cli.up
  'devbox':
    - system.raid
prod:
  '*':
    - common
    - system
    - docker
    - docker.compose
    - hugo
    - docker.compose-cli.build
    - docker.compose-cli.up
  'devbox':
    - system.raid