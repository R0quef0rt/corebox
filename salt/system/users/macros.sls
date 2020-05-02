{% macro group(name, gid) -%}
{{name}}-group:
  group.present:
    - name: {{name}}
    - gid: {{gid}}
{%- endmacro %}

{% macro admin_user(name, uid, gid) -%}
admin-{{name}}:
  user.present:
    - name: {{name}}
    - fullname: {{name}}
    - shell: /bin/bash
    - home: /home/{{name}}
    - createhome: True
    - gid_from_name: False
    - uid: {{uid}}
    - gid: {{gid}}
    - allow_uid_change: True
    - allow_gid_change: True
    - optional_groups:
      - docker
      - sudo
      - adm
{%- endmacro %}

{% macro service_user(name, uid, gid) -%}
service-{{name}}:
  user.present:
    - name: {{name}}
    - fullname: {{name}}
    - shell: /bin/bash
    - createhome: False
    - gid_from_name: False
    - uid: {{uid}}
    - gid: {{gid}}
    - allow_uid_change: True
    - allow_gid_change: True
{%- endmacro %}