dev:
  '*':
    - prod.system
    - prod.hugo
qa:
  '*':
    - prod.system
    - qa.raid
    - prod.docker
    - prod.hugo
    - qa.directory
    - prod.grafana
    - prod.hugo
prod:
  '*':
    - prod.system
    - prod.raid
    - prod.hugo
    - prod.directory
    - prod.grafana
    - prod.hugo
  'devbox':
    - prod.home.docker
  'houston':
    - prod.cdi.docker