/dev/md0:
  raid.present:
    - level: 5
    - devices:
      - /dev/sda
      - /dev/sdb
      - /dev/sdc
    - chunk: 64
    - run: True
  blockdev.formatted:
    - fs_type: ext4
    - force: True

md0:
  blockdev.tuned:
    - name: /dev/md0
    - read-write: True
    - read-ahead: 65536

/mnt:
  mount.mounted:
    - device: /dev/md0
    - fstype: ext4
    - persist: True
    - mount: True
    - mkmnt: True
    - opts:
      - defaults