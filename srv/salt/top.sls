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
    - system.directory
    - system.firewall
    - docker
    - docker.compose
  'devbox':
    - docker.compose-cmd
    - system.raid
  'newbox':
    - docker.compose-cmd
prod:
  '*':
    - common
    - system
    - system.directory
    - system.firewall
    - docker
    - docker.compose
  'devbox':
    - docker.compose-cmd
    - system.raid
  'newbox':
    - docker.compose-cmd