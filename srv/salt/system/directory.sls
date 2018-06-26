{% for path, args in pillar['directory'].iteritems() %}
{{path}}:
  file.directory:
    - user: {{args['user']}}
    - group: {{args['group']}}
    - mode: {{args['mode']}}
    - makedirs: True
    {% if "recurse" in directory %}
    - recurse:
      - user
      - group
      - mode
    {% endif %}
{% endfor %}