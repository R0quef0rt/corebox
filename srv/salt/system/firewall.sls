ssh:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport: 22
    - protocol: tcp
    - sport: 1025:65535
    - save: True

nzbget:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport: 6789
    - protocol: tcp
    - sport: 1025:65535
    - save: True

sonarr:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport: 8989
    - protocol: tcp
    - sport: 1025:65535
    - save: True

radarr:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport: 7878
    - protocol: tcp
    - sport: 1025:65535
    - save: True

duplicati:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport: 8200
    - protocol: tcp
    - sport: 1025:65535
    - save: True

sync-web:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport: 8888
    - protocol: tcp
    - sport: 1025:65535
    - save: True

sync-api:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport: 55555
    - protocol: tcp
    - sport: 1025:65535
    - save: True

plex:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport: 32400
    - protocol: tcp
    - sport: 1025:65535
    - save: True