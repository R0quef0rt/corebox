{% from "system/map.jinja" import system with context %}
include:
  - system.timezone
  - system.users
  {% if pillar['firewall-rules'] %}
  - system.firewall
  {% endif %}
  {% if pillar['directory'] %}
  - system.directory
  {% endif %}