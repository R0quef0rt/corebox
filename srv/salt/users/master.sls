master:

  user.present:
    - fullname: master
    - shell: /bin/bash
    - home: /home/master
    - createhome: True
    - gid_from_name: True
    - allow_uid_change: True
    - allow_gid_change: True
    - optional_groups:
      - docker
      - sudo

  group.present:
    - members:
      - master