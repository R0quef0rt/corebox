dev:
  '*':
    - common
    - system
    - docker
    - docker.compose
  'devbox':
    - docker.compose-cmd
  'cloudbox':
    - system.raid
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