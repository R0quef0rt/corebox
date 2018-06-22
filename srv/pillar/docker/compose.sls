# vi: set ft=yaml:

docker:

  install_docker_py: True
  
  pip:
    upgrade: False

  containers:
    skip_translate: ports, volumes
    force_present: True
    force_running: True

  compose:
    image:
      image: linuxserver/nzbget:125
      ports:
        - 6789:6789
      volumes:
        - "/etc/nzbget/config:/config"
        - "downloads:/downloads"
      environment:
        PUID: 1000
        GUID: 1000
      deploy: 
        restart_policy: 
          condition: always