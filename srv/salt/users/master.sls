master:
  user.present:
    - fullname: master
    - shell: /bin/bash
    - home: /home/master
    - uid: 1000
    - gid: 1000
    - groups:
      - docker