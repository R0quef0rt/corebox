timezone:
  main: America/Chicago

filesystem:
  mount: True

users:
  masters:
    - master
    - vagrant
  services:
    - nzbget
    - sonarr
    - radarr
    - plex
    - duplicati