{% for user in salt['pillar.get']('users:masters', {}) %}
{{user}}-master:
  user.present:
    - name: {{user}}
    - fullname: {{user}}
    - shell: /bin/bash
    - home: /home/{{user}}
    - createhome: True
    - gid_from_name: True
    - allow_uid_change: True
    - allow_gid_change: True
    - require:
      - group: {{user}}
    - optional_groups:
      - docker
      - sudo
      - adm
{{user}}:
  group.present
{% endfor %}

{% for user in salt['pillar.get']('users:services', {}) %}
{{user}}-service:
  user.present:
    - name: {{user}}
    - fullname: {{user}}
    - shell: /bin/bash
    - createhome: False
    - gid_from_name: True
    - require:
      - group: {{user}}
    - allow_uid_change: True
    - allow_gid_change: True
    - optional_groups:
      - docker
      - master
{{user}}:
  group.present
{% endfor %}