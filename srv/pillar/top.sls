dev:
  '*':
    - dev.system
    - dev.users
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