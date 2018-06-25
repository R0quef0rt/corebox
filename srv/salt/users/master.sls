master:
  user.present:
    - fullname: master
    - shell: /bin/bash
    - home: /home/master
    - uid: 1050
    - gid: 7648
    - groups:
      # - docker
      - sudo

master:
  group.present:
    - gid: 7648
    - system: True
    - addusers:
      - master