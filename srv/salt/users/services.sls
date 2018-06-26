{% for user in salt['pillar.get']('users:services', {}) %}
{{user}}:
  user.present:
    - fullname: {{user}}
    - shell: /bin/bash
    - createhome: False
    - gid_from_name: True
    - allow_uid_change: True
    - allow_gid_change: True
  group.present:
    - members:
      - {{user}}
{% endfor %}