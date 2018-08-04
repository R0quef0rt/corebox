{% from 'docker/compose/build.sls' import compose_build with context %}
{% from 'docker/compose/up.sls' import compose_up with context %}
{% from 'system/users/macros.sls' import group, master_user, service_user with context %}
{% from 'system/directory.sls' import add_directory with context %}

{{ group('media', '7000') }}
{{ service_user('nzbget', '6000', 'media') }}

{{ add_directory('/app/live/projects/nzbget/config', 'nzbget', 'media', '770', 'true') }}

{{ compose_build('nzbget') }}
{{ compose_up('nzbget') }}

url-nzbget:
  grains.list_present:
    - name: url-backend
    - value: nzbget, http://{{ grains['ip4_interfaces']['enp2s0'][0] }}/nzbget