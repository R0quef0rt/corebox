timezone:
  main: America/Chicago

filesystem:
  mount: True

directory:
  /etc/nzbget:
    - user: master
    - group: docker
    - mode: 777
  /etc/sonarr:
    - user: master
    - group: docker
    - mode: 777
  /etc/radarr:
    - user: master
    - group: docker
    - mode: 777
  /etc/plex:
    - user: master
    - group: docker
    - mode: 777
  /etc/duplicati:
    - user: master
    - group: docker
    - mode: 777

users:
  masters:
    - master
    - vagrant
  services:
    - salt