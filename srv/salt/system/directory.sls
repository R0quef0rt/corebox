{% for path, args in pillar['directory'].iteritems() %}
{{path}}:
  file.directory:
    - user: {{args['user']}}
    - group: {{args['group']}}
    - mode: {{args['mode']}}
    - makedirs: True
    {% for switches in pillar['args:recurse'].iteritems() %}
    - recurse:
      - user
      - group
      - mode
    {% endfor %}
{% endfor %}