{% for name, dir in pillar.get('directory', {}).items() %}
{{dir}}:
  file.directory:
  {% for key, value in pillar.get('dir', {}) %}
    - user: {{user}}
    - group: docker
    - mode: 777
    - makedirs: True
    - recurse:
      - user
      - group
      - mode
  {% endfor %}
{% endfor %}