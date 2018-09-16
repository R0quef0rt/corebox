{% from 'docker/build.sls' import compose_build with context %}
{% from 'docker/up.sls' import compose_up with context %}

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

hugo-{{project}}-services: 
  file.managed: 
    - template: jinja
    - source: salt://hugo/files/projects/{{project}}/services.tpl.md
    - name: /app/live/projects/hugo/src/{{project}}/content/services.md
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

url-hugo-core:
  grains.list_present:
    - name: url-backend
    - value: core, http://{{ grains['ip4_interfaces']['enp2s0'][0] }}/core

url-hugo-frontend:
  grains.list_present:
    - name: url-frontend
    - value: frontend, http://{{ grains['ip4_interfaces']['enp2s0'][0] }}/frontend

{{ compose_build('hugo') }}
{{ compose_up('hugo') }}
