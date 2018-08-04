{% from 'docker/compose/build.sls' import compose_build with context %}
{% from 'docker/compose/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}
{% from 'system/users/macros.sls' import group, master_user, service_user with context %}

{{ service_user('sonarr', '6003', 'media') }}

{{ compose_build('sonarr') }}
{{ compose_up('sonarr') }}

url-sonarr:
  grains.list_present:
    - name: url-backend
    - value: sonarr, http://{{ grains['ip4_interfaces']['enp2s0'][0] }}:8989

{{ add_port('sonarr', '8989', 'tcp') }}