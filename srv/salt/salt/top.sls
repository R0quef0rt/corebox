dev:
  '*':
    - common
    - system.timezone
  '*seedbox*':
    - docker
    - docker.compose
    - users.vagrant
qa:
  '*':
    - common
prod:
  '*':
    - common