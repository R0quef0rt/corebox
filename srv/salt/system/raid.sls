# /dev/md0:
#   raid:
#     - absent

# /mnt:
#   mount.unmounted:
#     - device: /dev/md0

{% for rule, args in pillar['raid_devices'].iteritems() %}
{{args['mnt']}}:
  raid.present:
    - level: 5
    - devices:
      - {{args['dev1']}}
      - {{args['dev2']}}
      - {{args['dev3']}}
    - chunk: 64
    - run: True
  blockdev.formatted:
    - fs_type: ext4
    - force: True

md0:
  blockdev.tuned:
    - name: /dev/md0
    - read-ahead: 65536
    - filesystem-read-ahead: 65536

/mnt:
  mount.mounted:
    - device: /dev/md0
    - fstype: ext4
    - persist: True
    - mount: True
    - mkmnt: True
    - opts:
      - defaults
{% endfor %}