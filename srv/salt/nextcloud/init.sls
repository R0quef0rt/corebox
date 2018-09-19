{% from 'docker/build.sls' import compose_build with context %}
{% from 'docker/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}

{{ compose_build('nextcloud') }}
{{ compose_up('nextcloud') }}

{{ add_port('nextcloud-http', '80', 'tcp') }}
{{ add_port('nextcloud-https', '443', 'tcp') }}