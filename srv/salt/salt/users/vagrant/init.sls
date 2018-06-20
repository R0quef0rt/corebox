vagrant:
  user.present:
    - fullname: vagrant
    - shell: /bin/bash
    - home: /home/vagrant
    - uid: 1000
    - gid: 1000
    - groups:
      - docker