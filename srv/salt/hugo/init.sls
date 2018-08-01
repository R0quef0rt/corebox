{% from 'docker/compose/build.sls' import compose_build with context %}
{% from 'docker/compose/up.sls' import compose_up with context %}

{% for project in salt['pillar.get']('hugo:projects', '') %}
/app/live/projects/hugo/src/{{project}}:
  file.recurse:
    - source: salt://hugo/files/src
    - include_empty: True

hugo-{{project}}: 
  file.managed: 
    - template: jinja
    - source: salt://hugo/files/projects/{{project}}/config.tpl.toml
    - name: /app/live/projects/hugo/src/{{project}}/config.toml
{% endfor %}

hugo-dockerfile: 
  file.managed: 
    - template: jinja
    - source: salt://hugo/files/Dockerfile
    - name: /app/live/projects/hugo/Dockerfile

hugo-entrypoint: 
  file.managed: 
    - template: jinja
    - source: salt://hugo/files/entrypoint.sh
    - name: /app/live/projects/hugo/entrypoint.sh

{{ compose_build('hugo') }}
{{ compose_up('hugo') }}
