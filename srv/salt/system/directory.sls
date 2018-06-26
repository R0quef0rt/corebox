{% for path, args in pillar['directory'].iteritems() %}
{{path}}:
  file.directory:
    - user: {{args['user']}}
    - group: {{args['group']}}
    - mode: {{args['mode']}}
    - makedirs: True
    {% if path in directory and "recurse" in directory.path and directory.path.recurse %}
    - recurse:
      - user
      - group
      - mode
    {% endif %}
{% endfor %}