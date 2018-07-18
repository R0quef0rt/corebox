prometheus-datasource:
  module.run:
    - name: http.query
    - url: http://localhost:3000/api/datasources
    - method: POST
    - data: '{
  "name":"prometheus",
  "type":"prometheus",
  "url":"http://prometheus_app_1:9090",
  "access":"server",
  "basicAuth":false,
  "password":"admin",
  "user":"admin",
}'