master:

  user.present:
    - fullname: master
    - shell: /bin/bash
    - home: /home/master
    - uid: 1005
    - gid: 1005
    - groups:
      # - docker
      - sudo

  group.present:
    - gid: 1005
    - system: True
    - addusers:
      - master