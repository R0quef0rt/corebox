dev:
  'os_family:Linux':
    - match: grain
    - prod.Ubuntu.docker
  'os_family:RedHat':
    - match: grain
    - prod.CentOS.docker
  '*':
    - prod.system
    - prod.grafana
    - prod.hugo
    - dev.dsc
    - dev.mariadb
    - dev.nextcloud
qa:
  'os_family:Linux':
    - match: grain
    - prod.Ubuntu.docker
  'os_family:RedHat':
    - match: grain
    - prod.CentOS.docker
  '*':
    - prod.system
    - prod.grafana
    - prod.hugo
    - dev.dsc
prod:
  'os_family:Linux':
    - match: grain
    - prod.Ubuntu.docker
  'os_family:RedHat':
    - match: grain
    - prod.CentOS.docker
  '*':
    - prod.system
    - prod.grafana
    - prod.hugo
    - dev.dsc