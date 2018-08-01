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
  'roles:wifi':
    - match: grain
    - unifi
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
  'devbox':
    - system.raid
  'roles:docker':
    - match: grain
    - docker
    - docker.compose
  'roles:proxy':
    - match: grain
    - traefik
  'roles:wifi':
    - match: grain
    - unifi
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
prod:
  '*':
    - common
    - system
    - system.repo
  'devbox':
    - system.raid
  'roles:docker':
    - match: grain
    - docker
    - docker.compose
  'roles:proxy':
    - match: grain
    - traefik
  'roles:wifi':
    - match: grain
    - unifi
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