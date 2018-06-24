terraform:
  user.present:
    - fullname: terraform
    - shell: /bin/bash
    - home: /home/terraform
    - uid: 1000
    - gid: 1000
    - groups:
      - docker