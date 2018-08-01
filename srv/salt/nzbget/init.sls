{% from 'docker/compose/build.sls' import compose_build with context %}
{{ compose_build('nzbget') }}
{% from 'docker/compose/up.sls' import compose_up with context %}
{{ compose_up('nzbget') }}

{% from 'system/users/macros.sls' import group, master_user, service_user with context %}
{{ group('media', '7000') }}
{{ service_user('nzbget', '6000', 'media') }}