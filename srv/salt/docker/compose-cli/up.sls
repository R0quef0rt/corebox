{% for repo in salt['pillar.get']('compose:repos', 'https://github.com/R0quef0rt/devbox') %}
  {% for project in salt['pillar.get']('compose:projects', 'hugo') %}

{{project}}-compose-pull:
  cmd.run:
    - name: 'docker-compose pull'
    - cwd: /app/dev/projects/{{project}}
    - require:
      - pip: compose

{{project}}-compose-up:
  cmd.run:
    - name: 'docker-compose up --no-build -d'
    - cwd: /app/dev/projects/{{project}}
    - require:
      - cmd: {{project}}-compose-pull
  {% endfor %}
{% endfor %}