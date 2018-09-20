{% from 'docker/build.sls' import compose_build with context %}
{% from 'docker/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}
{% from 'grains/url.sls' import set_url with context %}

{{ compose_build('nextcloud') }}
{{ compose_up('nextcloud') }}

{{ set_url('nextcloud', 'backend', 'http', ':5432') }}

{{ add_port('nextcloud-http', '5432', 'tcp') }}