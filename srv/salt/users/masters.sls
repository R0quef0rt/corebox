{% for name, group, user in pillar.get('users:masters', {}).items() %}
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
    - members:
      - {{user}}
{% endfor %}