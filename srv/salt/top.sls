dev:
  '*':
    - common
    - system.timezone
    - filesystem.raid5
    - system.firewall.devbox
    # - docker
    # - docker.compose
    # - docker.compose-cmd
    - users.master
  'sandbox':
    - system.directory
prod:
  '*':
    - common
    - system
    - system.directory