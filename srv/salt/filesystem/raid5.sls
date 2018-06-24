# /dev/md0:
#   raid:
#     - absent

# /mnt:
#   mount.unmounted:
#     - device: /dev/md0

/dev/md0:
  raid.present:
    - level: 5
    - devices:
      - /dev/sda
      - /dev/sdb
      - /dev/sdc
    - chunk: 64
    - run: True

md0:
  blockdev.tuned:
    - name: /dev/md0
    - read-write: True
    - read-ahead: 65536
  blockdev.formatted:
    - fs_type: ext4
    - force: True

/mnt:
  mount.mounted:
    - device: /dev/md0
    - fstype: ext4
    - persist: True
    - mount: True
    - mkmnt: True
    - opts:
      - defaults