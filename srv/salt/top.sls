dev:
  '*':
    - common
    - system.timezone
    # - system.directory
    # - system.firewall.devbox
    # - docker
    # - docker.compose
    # - docker.compose-cmd
    # - users.vagrant
prod:
  '*':
    - common
    - system
    - system.directory