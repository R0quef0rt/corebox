master:

  user.present:
    - fullname: master
    - password: $1$fVgw2iOU$ncUS3h.adzyCpGrceZInx1
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