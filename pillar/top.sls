dev:
  'devbox':
    - shared
    - dev
qa:
  'qabox':
    - shared
    - qa
# prod:
#   '*':
#     - prod.system
#     - prod.grafana
#     - prod.hugo
#     - dev.dsc
#     - prod.virtualbox
#     - prod.packer
#   'os_family:Linux':
#     - match: grain
#     - prod.Ubuntu.docker
#   'os_family:RedHat':
#     - match: grain
#     - prod.CentOS.docker