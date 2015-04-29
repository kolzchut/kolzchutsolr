FROM java:8

RUN mkdir /solr && cd /solr \
    && wget http://archive.apache.org/dist/lucene/solr/4.10.4/solr-4.10.4.tgz \
    && tar xzf solr-4.10.4.tgz \
    && rm -rf solr-4.10.4.tgz \
    && ln -s solr-4.10.4 solr

RUN mkdir /solr/work
COPY dump_current.xml.gz /solr/work/dump_current.xml.gz
COPY solr /solr/work/solr
COPY solr.xml /solr/work/solr.xml
VOLUME /work
WORKDIR /work

CMD cp -r /solr/work/* . && gunzip dump_current.xml.gz && cd /solr/solr/example && java -Dsolr.solr.home="/work/" -jar start.jar
