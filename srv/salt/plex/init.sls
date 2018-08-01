{% from 'docker/compose/build.sls' import compose_build with context %}
{% from 'docker/compose/up.sls' import compose_up with context %}
{% from 'system/users/macros.sls' import group, master_user, service_user with context %}
{% from 'system/firewall.sls' import add_port with context %}

{{ service_user('plex', '6001', 'media') }}

{{ compose_build('plex') }}
{{ compose_up('plex') }}

url-plex:
  grains.list_present:
    - name: url-backend
    - value: plex, http://{{ grains['ipv4']|last }}:32400

{{ add_port('plex', '32400', 'tcp') }}
