dev:
  '*':
    - common
    - system.timezone
    - filesystem.raid5
    - system.firewall.devbox
    # - devbox
    - users.master
  'sandbox':
    - system.directory
    - docker
    - docker.compose
    - docker.compose-cmd
prod:
  '*':
    - common
    - system
    - system.directory