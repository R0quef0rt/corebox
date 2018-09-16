{% from 'docker/build.sls' import compose_build with context %}
{% from 'docker/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}

{{ compose_build('plex') }}
{{ compose_up('plex') }}

url-plex:
  grains.list_present:
    - name: url-backend
    - value: plex, http://{{ grains['ip4_interfaces']['enp2s0'][0] }}:32400

{{ add_port('plex', '32400', 'tcp') }}
