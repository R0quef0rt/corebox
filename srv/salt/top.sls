dev:
  '*':
    - common
    - system
  'roles:docker':
    - match: grain
    - docker
    - docker.compose
  'roles:proxy':
    - match: grain
    - traefik
  'roles:scm':
    - match: grain
    - gitlab
  'roles:ldap':
    - match: grain
    - freeipa
  'roles:mediaserver':
    - match: grain
    - nzbget
    - sonarr
    - radarr
    - plex
    - sync
    - duplicati
  'roles:dashboard':
    - match: grain
    - hugo
  'roles:siem':
    - match: grain
    - elasticsearch
    - prometheus
    - grafana
    - filebeat
qa:
  '*':
    - common
    - system
    - system.repo
    - docker
    - docker.compose
  'cloudbox':
    - traefik
    - hugo
    - elasticsearch
    - prometheus
    - grafana
    - docker.compose-cli.build
    - docker.compose-cli.up
  'devbox':
    - system.raid
prod:
  '*':
    - common
    - system
    - system.repo
    - docker
    - docker.compose
  'devbox':
    - traefik
    - hugo
    - elasticsearch
    - prometheus
    - grafana
    - docker.compose-cli.build
    - docker.compose-cli.up
    - system.raid
  'houston':
    - traefik
    - hugo
    - docker.compose-cli.build
    - docker.compose-cli.up