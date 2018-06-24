master:
  user.present:
    - fullname: master
    - shell: /bin/bash
    - home: /home/master
    - uid: 1050
    - gid: 1050
    - groups:
      - docker