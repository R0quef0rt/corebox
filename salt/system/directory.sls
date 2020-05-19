{% for app in salt['pillar.get']('directory') %}
{{app['name']}}-directory:
  file.directory:
    - name: {{app['path']}}
    - user: {{app['user']}}
    - group: {{app['group']}}
    - mode: {{app['mode']}}
    - makedirs: True
    {% if app['recurse'] == 'true' %}
    - recurse:
      - user
      - group
      - mode
    {% endif %}
{%- endfor %}