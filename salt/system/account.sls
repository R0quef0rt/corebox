{% for user in salt['pillar.get']('account') %}
{{user['name']}}-account:
  group.present:
    - name: {{user['name']}}
    - gid: {{user['gid']}}
  user.present:
    - name: {{user['name']}}
    - fullname: {{user['name']}}
    - shell: /bin/bash
    - home: /home/{{user['name']}}
    - createhome: True
    - gid_from_name: False
    - uid: {{user['uid']}}
    - gid: {{user['gid']}}
    - allow_uid_change: True
    - allow_gid_change: True
    {% if user['name'] == 'master' %}
    - optional_groups:
      - docker
      - sudo
      - adm
    {% endif %}
{% endfor %}