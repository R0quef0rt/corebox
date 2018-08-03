{% from 'docker/compose/build.sls' import compose_build with context %}
{% from 'docker/compose/up.sls' import compose_up with context %}
{% from 'system/firewall.sls' import add_port with context %}

{{ compose_build('gitlab') }}
{{ compose_up('gitlab') }}

url-gitlab:
  grains.list_present:
    - name: url-backend
    - value: gitlab, http://{{ grains['ipv4']|last }}/gitlab

{{ add_port('gitlab-container-registry', '5000', 'tcp') }}