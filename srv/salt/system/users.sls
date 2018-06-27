{% for user in salt['pillar.get']('users:masters', {}) %}
{{user}}-master:
  user.present:
    - name: {{user}}
    - fullname: {{user}}
    - shell: /bin/bash
    - home: /home/{{user}}
    - createhome: True
    {% set count = 1050 %}
      {% for i in p %}
    - uid: {{ count }}
      {% set count = count + 1 %}
    {% endfor %}
    - gid_from_name: True
    - allow_uid_change: True
    - allow_gid_change: True
    - optional_groups:
      - docker
      - sudo
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
    {% set count = 1050 %}
      {% for i in p %}
    - uid: {{ count }}
      {% set count = count + 1 %}
    {% endfor %}
    - gid_from_name: True
    - allow_uid_change: True
    - allow_gid_change: True
{{user}}:
  group.present
{% endfor %}