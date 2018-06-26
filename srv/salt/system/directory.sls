{% for path, args in pillar['directory'].iteritems() %}
{{path}}:
  file.directory:
    - user: {{args['user']}}
    - group: {{args['group']}}
    - mode: {{args['mode']}}
    - makedirs: True
    {% if "recurse" in system.directory.path %}
    - recurse:
      - user
      - group
      - mode
    {% endif %}
{% endfor %}