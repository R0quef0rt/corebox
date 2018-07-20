# Use an official Python runtime as a parent image
FROM docker.elastic.co/kibana/kibana:5.5.2
RUN bin/kibana-plugin remove x-pack
COPY kibana.yml /usr/share/kibana/config/