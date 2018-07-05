{% for project in salt['pillar.get']('compose:projects', '') %}
{{project}}-compose-pull:
  cmd.run:
    - name: 'docker-compose pull'
    - cwd: /app/dev/projects/{{project}}
    - require:
      - pip: compose
      - sls: build
{{project}}-compose-up:
  cmd.run:
    - name: 'docker-compose up --no-build -d'
    - cwd: /app/dev/projects/{{project}}
    - require:
      - cmd: {{project}}-compose-pull
{% endfor %}