dev:
  '*':
    - prod.system
    - prod.firewall
    - prod.hugo
qa:
  '*':
    - prod.system
    - qa.raid
    - prod.docker
    - prod.hugo
    - prod.firewall
    - qa.directory
    - prod.grafana
    - prod.hugo
prod:
  '*':
    - prod.system
    - prod.raid
    - prod.hugo
    - prod.firewall
    - prod.directory
    - prod.grafana
    - prod.hugo
  'devbox':
    - prod.home.docker
  'houston':
    - prod.cdi.docker