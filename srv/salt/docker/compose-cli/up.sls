{% for project in salt['pillar.get']('compose:projects', '') %}
{{project}}-compose-pull:
  cmd.run:
    - name: 'docker-compose pull'
    {% if saltenv == 'dev' %}
    - cwd: /app/dev/projects/{{project}}
    {% else %}
    - cwd: /app/live/projects/{{project}}
    {% endif %}
    - require:
      - cmd: {{project}}-compose-build
{{project}}-compose-up:
  cmd.run:
    - name: 'docker-compose up --no-build -d'
    {% if saltenv == 'dev' %}
    - cwd: /app/dev/projects/{{project}}
    {% else %}
    - cwd: /app/live/projects/{{project}}
    {% endif %}
    - require:
      - cmd: {{project}}-compose-pull
{% endfor %}