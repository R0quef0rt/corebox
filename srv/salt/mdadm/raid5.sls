/dev/md0:
  raid.present:
    - level: 5
    - devices:
      - /dev/sda
      - /dev/sdb
      - /dev/sdc
    - chunk: 256
    - run: True
  blockdev.formatted:
    - fs_type: ext4
    - force: True