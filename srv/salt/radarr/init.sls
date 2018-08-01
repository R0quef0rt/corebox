{% from 'docker/compose/build.sls' import compose_build with context %}
{{ compose_build('radarr') }}
{% from 'docker/compose/up.sls' import compose_up with context %}
{{ compose_up('radarr') }}

{% from 'system/users/macros.sls' import group, master_user, service_user with context %}
{{ service_user('radarr', '6002', 'media') }}