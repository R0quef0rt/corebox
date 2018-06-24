{% for key, dir in pillar.get('directory', {}).items() %}
{{dir}}:
  file.directory:
    - user: vagrant
    - group: docker
    - mode: 777
    - makedirs: True
    - recurse:
      - user
      - group
      - mode
{% endfor %}