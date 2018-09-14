{% from 'docker/build.sls' import compose_build with context %}
{% from 'docker/up.sls' import compose_up with context %}

filebeat-config: 
  file.managed: 
    - template: jinja
    - source: salt://filebeat/files/filebeat.tpl.yml
    - name: /app/live/projects/filebeat/filebeat.yml

{{ compose_build('filebeat') }}
{{ compose_up('filebeat') }}