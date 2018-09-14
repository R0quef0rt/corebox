{% from 'docker/build.sls' import compose_build with context %}
{% from 'docker/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}

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

{{ compose_build('elasticsearch') }}
{{ compose_up('elasticsearch') }}

url-elasticsearch:
  grains.list_present:
    - name: url-backend
    - value: elasticsearch, http://{{ grains['ip4_interfaces']['eth0'][0] }}:9200

url-kibana:
  grains.list_present:
    - name: url-backend
    - value: kibana, http://{{ grains['ip4_interfaces']['eth0'][0] }}:5601

{{ add_port('elasticsearch-api-http', '9200', 'tcp') }}
{{ add_port('elasticsearch-api-https', '9300', 'tcp') }}
{{ add_port('kibana', '5601', 'tcp') }}
{{ add_port('logstash-syslog-tcp', '5140', 'tcp') }}
{{ add_port('logstash-syslog-udp', '5140', 'udp') }}
{{ add_port('logstash-beats-tcp', '5044', 'tcp') }}
{{ add_port('logstash-beats-udp', '5044', 'udp') }}