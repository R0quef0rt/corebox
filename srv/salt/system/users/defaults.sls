{% from 'system/users/macros.sls' import group, master_user, service_user with context %}
{{ group('master', '1050') }}
{{ master_user('master', '1050', 'master') }}