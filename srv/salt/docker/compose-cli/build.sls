{% for repo in salt['pillar.get']('compose:repos', 'https://github.com/R0quef0rt/devbox') %}
  {% if saltenv == 'qa' or 'prod' %}
{{repo}}-download-latest:
  git.latest:
    - name: {{repo}}
    - rev: master
    - target: /app/live
    - force_checkout: True
    - force_clone: True
    - force_fetch: True
    - force_reset: True
    - depth: 1
  {% endif %}
{% endfor %}

{% for project in salt['pillar.get']('compose:projects', '') %}
{{project}}-compose-config: 
  file.managed: 
    - template: jinja
    - source: salt://{{project}}/files/docker-compose.tpl.yml
    - name: /app/live/projects/{{project}}/docker-compose.yml

{{project}}-compose-build:
  cmd.run:
    - name: 'docker-compose build'
    - cwd: /app/live/projects/{{project}}
    - require:
      - pip: compose
      - file: {{project}}-compose-config
{% endfor %}