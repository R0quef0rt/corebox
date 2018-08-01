vm.max_map_count:
  sysctl.present:
    - value: 262144

kibana-config: 
  file.managed: 
    - template: jinja
    - source: salt://elasticsearch/files/kibana/kibana.tpl.yml
    - name: /app/live/projects/elasticsearch/kibana.yml

/app/live/projects/elasticsearch/logstash/pipeline:
  file.recurse:
    - source: salt://elasticsearch/files/logstash/pipeline
    - include_empty: True

{% from 'docker/compose/build.sls' import compose_build with context %}
{{ compose_build('elasticsearch') }}
{% from 'docker/compose/up.sls' import compose_up with context %}
{{ compose_up('elasticsearch') }}