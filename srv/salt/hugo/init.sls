{% from 'docker/build.sls' import compose_build with context %}
{% from 'docker/up.sls' import compose_up with context %}
{% from 'grains/url.sls' import set_url with context %}

{% for project in salt['pillar.get']('hugo:projects', '') %}
/app/live/projects/hugo/src/{{project}}:
  file.recurse:
    - source: salt://hugo/src
    - include_empty: True

hugo-{{project}}: 
  file.managed: 
    - template: jinja
    - source: salt://hugo/projects/{{project}}/config.tpl.toml
    - name: /app/live/projects/hugo/src/{{project}}/config.toml

hugo-{{project}}-services: 
  file.managed: 
    - template: jinja
    - source: salt://hugo/projects/{{project}}/services.tpl.md
    - name: /app/live/projects/hugo/src/{{project}}/content/services.md
{% endfor %}

{{ set_url('hugo', 'backend', 'http', '/core') }}
{{ set_url('hugo', 'frontend', 'http', '/frontend') }}

{{ compose_build('hugo') }}
{{ compose_up('hugo') }}
