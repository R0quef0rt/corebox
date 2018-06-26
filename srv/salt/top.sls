dev:
  '*':
    - common
    - system
    - docker
    - docker.compose
  'sandbox':
    - common
    - system
    - docker
    - docker.compose
    - docker.compose-cmd
  'devbox':
    - common
    - system
    - docker
    - docker.compose
    - system.raid
qa:
  '*':
    - common
    - system
    - docker
    - docker.compose
  'devbox':
    - docker.compose-cmd
    - system.raid
prod:
  '*':
    - common
    - system
    - docker
    - docker.compose
  'devbox':
    - docker.compose-cmd
    - system.raid