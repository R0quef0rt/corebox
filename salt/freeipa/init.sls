{% from 'docker/build.sls' import compose_build with context %}
{% from 'docker/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}
{% from 'grains/url.sls' import set_url with context %}

{{ compose_build('freeipa') }}
{{ compose_up('freeipa') }}

{{ set_url('freeipa', 'backend', 'https', '/ipa/ui') }}

{{ add_port('freeipa-http', '80', 'tcp') }}
{{ add_port('freeipa-https', '443', 'tcp') }}