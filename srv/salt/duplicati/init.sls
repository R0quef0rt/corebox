{% from 'docker/build.sls' import compose_build with context %}
{% from 'docker/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}
{% from 'grains/url.sls' import set_url with context %}

{{ compose_build('duplicati') }}
{{ compose_up('duplicati') }}

{{ set_url('duplicati', 'backend', 'http', ':8200') }}

{{ add_port('duplicati', '8200', 'tcp') }}