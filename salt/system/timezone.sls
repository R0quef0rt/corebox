{% set timezone = salt['pillar.get']('timezone', 'America/Chicago') %}
{{timezone}}:
  timezone.system:
    - utc: True