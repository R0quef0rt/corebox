{% set ns = namespace(found=false) %}
  {% for uid in [1050, 1051, 1052, 1053, 1054, 1055, 1056, 1057, 1058, 1059] %}
  {% set ns.found = uid == 10 %}
{% endfor %}
{% for user in salt['pillar.get']('users:masters', {}) %}
{{user}}-master:
  user.present:
    - name: {{user}}
    - fullname: {{user}}
    - shell: /bin/bash
    - home: /home/{{user}}
    - createhome: True
    - uid: {{ ns.uid }}
    - gid_from_name: True
    - allow_uid_change: True
    - allow_gid_change: True
    - optional_groups:
      - docker
      - sudo
{{user}}:
  group.present
{% endfor %}

{% set ns = namespace(found=false) %}
  {% for uid in [1050, 1051, 1052, 1053, 1054, 1055, 1056, 1057, 1058, 1059] %}
  {% set ns.found = uid == 10 %}
{% for user in salt['pillar.get']('users:services', {}) %}
{% endfor %}
{{user}}-service:
  user.present:
    - name: {{user}}
    - fullname: {{user}}
    - shell: /bin/bash
    - createhome: False
    - uid: {{ ns.uid }}
    - gid_from_name: True
    - allow_uid_change: True
    - allow_gid_change: True
{{user}}:
  group.present
{% endfor %}