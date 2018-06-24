/dev/md0:
  raid.present:
    - level: 5
    - devices:
      - /dev/sda
      - /dev/sdb
      - /dev/sdc
    - chunk: 256
    - run: True

/dev/md0:
  blockdev.formatted:
    - name: mnt
    - fs_type: ext4
    - force: True