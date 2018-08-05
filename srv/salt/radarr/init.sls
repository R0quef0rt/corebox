{% from 'docker/compose/build.sls' import compose_build with context %}
{% from 'docker/compose/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}

{{ compose_build('radarr') }}
{{ compose_up('radarr') }}

url-radarr:
  grains.list_present:
    - name: url-backend
    - value: radarr, http://{{ grains['ip4_interfaces']['enp2s0'][0] }}:7878

{{ add_port('radarr', '7878', 'tcp') }}