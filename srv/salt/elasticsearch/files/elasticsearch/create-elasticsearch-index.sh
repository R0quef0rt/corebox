#!/bin/sh

# Create a new index in ES

while ! echo exit | curl -XPUT 'http://localhost:9200/_template/filebeat' -d@/home/ubuntu/docker/elasticsearch/templates/winlogbeat.template.json; do sleep 10; done