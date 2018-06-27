{% set ns = namespace(found=false) %}
  {% for muid in [1050, 1051, 1052, 1053, 1054, 1055, 1056, 1057, 1058, 1059] %}
  {% set ns.found = muid == 10 %}
{% endfor %}
{% for user in salt['pillar.get']('users:masters', {}) %}
{{user}}-master:
  user.present:
    - name: {{user}}
    - fullname: {{user}}
    - shell: /bin/bash
    - home: /home/{{user}}
    - createhome: True
    - uid: {{ ns.muid }}
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
  {% for suid in [1000, 1011, 1012, 1013, 1014, 1015, 1016, 1017, 1018, 1019] %}
  {% set ns.found = suid == 10 %}
{% for user in salt['pillar.get']('users:services', {}) %}
{% endfor %}
{{user}}-service:
  user.present:
    - name: {{user}}
    - fullname: {{user}}
    - shell: /bin/bash
    - createhome: False
    - uid: {{ ns.suid }}
    - gid_from_name: True
    - allow_uid_change: True
    - allow_gid_change: True
{{user}}:
  group.present
{% endfor %}