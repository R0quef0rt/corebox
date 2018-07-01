dev:
  '*':
    - common
    - system
    - docker
    - docker.compose
  'sandbox':
    - docker.compose-cmd
  'devbox':
    - docker.compose-cmd
    - system.raid
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