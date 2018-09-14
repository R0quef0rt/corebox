{% macro compose_build(project) -%}
{{project}}-directory:
  file.directory:
    - name: /app/live/projects/{{project}}
    - makedirs: True
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
      - file: {{project}}-compose-config
{%- endmacro %}