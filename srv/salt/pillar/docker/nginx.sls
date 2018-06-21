# vi: set ft=yaml:

docker:
  
  install_docker_py: True

  containers:
    skip_translate: ports
    force_present: True
    force_running: True

  compose:
   nginx-latest:
      image: 'nginx:latest'
      container_name: 'nginx-latest'
      ports:
        - '80:80'
        - '443:443'
      deploy:
        restart_policy:
          condition: on-failure
          delay: 5s
          max_attempts: 3
          window: 120s