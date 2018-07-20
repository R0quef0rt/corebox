# Use an official Python runtime as a parent image
FROM docker.elastic.co/logstash/logstash:5.5.2

RUN rm -f /usr/share/logstash/pipeline/logstash.conf
ADD certs/ /usr/share/logstash/certs/
ADD pipeline/ /usr/share/logstash/pipeline/
ADD config/ /usr/share/logstash/config/
CMD [ "-f", "/usr/share/logstash/pipeline/" ]