{% macro compose_up(project) -%}

{{project}}-compose-pull:
  cmd.run:
    - name: 'docker-compose pull'
    - cwd: /app/live/projects/{{project}}
    - require:
      - cmd: {{project}}-compose-build

{{project}}-compose-up:
  cmd.run:
    - name: 'docker-compose up --no-build -d'
    - cwd: /app/live/projects/{{project}}
    - require:
      - cmd: {{project}}-compose-pull
      
{%- endmacro %}