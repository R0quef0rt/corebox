directory:
  /etc/nzbget:
    user: master
    group: nzbget
    mode: 776
    recurse: False
  /etc/sonarr:
    user: master
    group: sonarr
    mode: 776
    recurse: False
  /etc/radarr:
    user: master
    group: radarr
    mode: 776
    recurse: False
  /etc/plex:
    user: master
    group: plex
    mode: 776
    recurse: False
  /etc/duplicati:
    user: master
    group: duplicati
    mode: 776
    recurse: False
  /etc/sync:
    user: master
    group: sync
    mode: 776
    recurse: False
  /mnt:
    user: master
    group: docker
    mode: 777
    recurse: True