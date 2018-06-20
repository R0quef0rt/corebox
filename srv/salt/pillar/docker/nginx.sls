# vi: set ft=yaml:

# Docker compose supported attributes
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
      # volumes:
      #   - /srv/docker-registry/nginx/:/etc/nginx/conf.d
      #   - /srv/docker-registry/auth/:/etc/nginx/conf.d/auth
      #   - /srv/docker-registry/certs/:/etc/nginx/conf.d/certs
      #restart: 'always'    # compose v1.9
      deploy:               # compose v3
        restart_policy:
          condition: on-failure
          delay: 5s
          max_attempts: 3
          window: 120s