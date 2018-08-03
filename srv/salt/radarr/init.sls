{% from 'docker/compose/build.sls' import compose_build with context %}
{% from 'docker/compose/up.sls' import compose_up with context %}
{% from 'system/users/macros.sls' import group, master_user, service_user with context %}
{% from 'system/firewall.sls' import add_port with context %}

{{ service_user('radarr', '6002', 'media') }}

{{ compose_build('radarr') }}
{{ compose_up('radarr') }}

url-radarr:
  grains.list_present:
    - name: url-backend
    - value: radarr, http://{{ grains['ipv4']|last }}:7878

{{ add_port('radarr', '7878', 'tcp') }}