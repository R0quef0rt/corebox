{% from 'docker/build.sls' import compose_build with context %}
{% from 'docker/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}
{% from 'grains/url.sls' import set_url with context %}

{{ compose_build('gitlab') }}
{{ compose_up('gitlab') }}

{{ set_url('gitlab', 'backend', 'http', '/gitlab') }}

{{ add_port('gitlab-container-registry', '5000', 'tcp') }}