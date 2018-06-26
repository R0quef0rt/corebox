{% for rule, args in pillar['firewall-rules'].iteritems() %}
{{rule}}:
  iptables.append:
    - table: filter
    - chain: {{args['chain']}}
    - jump: {{args['jump']}}
    - match: state
    - connstate: NEW
    - dport: {{args['dport']}}
    - protocol: {{args['protocol']}}
    - sport: 1025:65535
    - save: True
{% endfor %}