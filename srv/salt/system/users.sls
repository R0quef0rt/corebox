{% for user in salt['pillar.get']('users:masters', {}) %}
{{user}}:
  user.present:
    - fullname: {{user}}
    - shell: /bin/bash
    - home: /home/{{user}}
    - createhome: True
    - gid_from_name: True
    - allow_uid_change: True
    - allow_gid_change: True
    - optional_groups:
      - docker
      - sudo
  group.present:
    - addusers:
      - {{user}}
{% endfor %}

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
    - addusers:
      - {{user}}
{% endfor %}