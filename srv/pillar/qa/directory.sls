dir_set_perms: True

directory:
  /etc/nzbget:
    user: nzbget
    group: master
    mode: 660
    recurse: False
  /etc/sonarr:
    user: sonarr
    group: master
    mode: 660
    recurse: False
  /etc/radarr:
    user: radarr
    group: master
    mode: 660
    recurse: False
  /etc/plex:
    user: plex
    group: master
    mode: 660
    recurse: False
  /etc/duplicati:
    user: duplicati
    group: master
    mode: 660
    recurse: False