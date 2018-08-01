{% from 'docker/compose/build.sls' import compose_build with context %}
{% from 'docker/compose/up.sls' import compose_up with context %}
{% from 'system/users/macros.sls' import group, master_user, service_user with context %}
{% from 'system/firewall.sls' import add_port with context %}

{{ group('media', '7000') }}
{{ service_user('nzbget', '6000', 'media') }}

{{ compose_build('nzbget') }}
{{ compose_up('nzbget') }}

url-nzbget:
  grains.list_present:
    - name: url-backend
    - value: nzbget, http://{{ grains['ipv4']|last }}:6789

{{ add_port('nzbget', '6789', 'tcp') }}