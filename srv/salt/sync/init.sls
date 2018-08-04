{% from 'docker/compose/build.sls' import compose_build with context %}
{% from 'docker/compose/up.sls' import compose_up with context %}
{% from 'system/users/macros.sls' import group, master_user, service_user with context %}
{% from 'system/firewall.sls' import add_port with context %}

{{ service_user('sync', '6004', 'media') }}

{{ compose_build('sync') }}
{{ compose_up('sync') }}

url-sync:
  grains.list_present:
    - name: url-backend
    - value: sync, http://{{ grains['ip4_interfaces']['enp2s0'][0] }}:8888

{{ add_port('sync-web', '8888', 'tcp') }}
{{ add_port('sync-proxy', '55555', 'tcp') }}