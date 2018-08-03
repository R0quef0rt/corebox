{% macro add_port(name, dport, protocol) -%}
{{name}}-managed-rule:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport: {{dport}}
    - protocol: {{protocol}}
    - sport: 1025:65535
    - save: True
{%- endmacro %}