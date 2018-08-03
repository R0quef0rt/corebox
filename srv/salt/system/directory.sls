{% macro add_directory(path, user, group, mode, recurse) -%}
{{path}}-directory:
  file.directory:
    - name: {{path}}
    - user: {{user}}
    - group: {{group}}
    - mode: {{mode}}
    - makedirs: True
    {% if recurse == 'true' %}
    - recurse:
      - user
      - group
      - mode
    {% endif %}
{%- endmacro %}