{% for app in salt['pillar.get']('firewall') %}
{{app['name']}}-managed-rule:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport: {{app['dport']}}
    - protocol: {{app['protocol']}}
    - sport: 1025:65535
    - save: True
{% endfor %}