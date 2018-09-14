{% from 'docker/build.sls' import compose_build with context %}
{% from 'docker/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}

{{ compose_build('sonarr') }}
{{ compose_up('sonarr') }}

url-sonarr:
  grains.list_present:
    - name: url-backend
    - value: sonarr, http://{{ grains['ip4_interfaces']['eth0'][0] }}:8989

{{ add_port('sonarr', '8989', 'tcp') }}