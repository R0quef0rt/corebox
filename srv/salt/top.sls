dev:
  '*':
    - common
    - system
    - docker
    - docker.compose
  'devbox':
    - docker.compose-cmd
    - system.raid
  'newbox':
    - docker.compose-cmd
qa:
  '*':
    - common
    - system
    - docker
    - docker.compose
  'devbox':
    - docker.compose-cmd
prod:
  '*':
    - common