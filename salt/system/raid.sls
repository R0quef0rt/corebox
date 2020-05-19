{% from 'system/directory.sls' import add_directory with context %}

{% for mount, args in pillar['raid_devices'].iteritems() %}
{{mount}}:
  raid.present:
    - level: 5
    - devices:
      - {{args['dev1']}}
      - {{args['dev2']}}
      - {{args['dev3']}}
    - chunk: 64
    - run: True
  blockdev.formatted:
    - fs_type: {{args['fs_type']}}
    - force: True
md0:
  blockdev.tuned:
    - name: {{mount}}
    - read-ahead: 65536
    - filesystem-read-ahead: 65536

{{args['mounted_dir']}}:
  mount.mounted:
    - device: {{mount}}
    - fstype: {{args['fs_type']}}
    - persist: True
    - mount: True
    - mkmnt: True
    - opts:
      - defaults

{{ add_directory('/mnt', 'master', 'media', '777', 'true') }}

{% endfor %}