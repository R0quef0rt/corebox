{% for path, args in pillar['directory'].iteritems() %}
{{path}}-directory:
  file.directory:
    - name: {{path}}
    - user: {{args['user']}}
    - group: {{args['group']}}
    - mode: {{args['mode']}}
    - makedirs: True
    {% if args['recurse'] %}
    - recurse:
      - user
      - group
      - mode
    {% endif %}
{% endfor %}