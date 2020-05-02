{% macro compose_build(project) -%}

{{project}}-directory:
  file.directory:
    - name: /app/live/projects/{{project}}
    - makedirs: True

{{project}}-manage-files: 
  file.recurse: 
    - template: jinja
    - source: salt://{{project}}/files
    - name: /app/live/projects/{{project}}

{{project}}-compose-build:
  cmd.run:
    - name: 'docker-compose build'
    - cwd: /app/live/projects/{{project}}
    - require:
      - file: {{project}}-manage-files

{%- endmacro %}