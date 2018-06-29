{% from "system/map.jinja" import system with context %}
include:
  - system.timezone
  - system.users
  - system.firewall
  - system.raid
  {% if pillar['dir_set_perms'] %}
  - system.directory
  {% endif %}