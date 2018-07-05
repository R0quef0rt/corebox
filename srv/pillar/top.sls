dev:
  '*':
    - dev.system
    - dev.users
    - dev.docker
    - dev.directory
qa:
  '*':
    - prod.system
    - qa.raid
    - prod.users
    - prod.firewall
    - prod.directory
prod:
  '*':
    - prod.system
    - prod.raid
    - prod.users
    - prod.firewall
    - prod.directory