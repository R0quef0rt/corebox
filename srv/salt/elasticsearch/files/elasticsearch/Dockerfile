FROM library/elasticsearch:5.5.2
COPY elasticsearch.yml /usr/share/elasticsearch/config/
RUN bin/elasticsearch-plugin install repository-s3
EXPOSE 9200
EXPOSE 9300