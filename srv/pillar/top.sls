dev:
  '*':
    - dev.settings
    - dev.firewall
    - dev.system.directory
qa:
  '*':
    - qa.settings
    - qa.firewall
    - qa.system.directory
prod:
  '*':
    - prod.settings
    - prod.firewall
    - prod.system.directory