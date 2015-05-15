FROM ubuntu:vivid

MAINTAINER Ramon Brooker <rbrooker@aetherealmind.com>

ENV DEBIAN_FRONTEND noninteractive

# to allow supervisor to be installed 
RUN echo exit 101 > /usr/sbin/policy-rc.d
RUN chmod +x /usr/sbin/policy-rc.d


# for setting
ENV ES_VERSION_MAJOR=1.5
ENV ES_VERISON_MINOR=1.5.2

# install need java run time and update 
RUN apt-get update && apt-get -y upgrade && apt-get install -y openjdk-7-jre-headless logrotate


# get and install logstash
ADD  https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-${ES_VERISON_MINOR}.tar.gz /
RUN tar -xvzf /elasticsearch-${ES_VERISON_MINOR}.tar.gz && mv /elasticsearch-${ES_VERISON_MINOR} /es

# Clean up
RUN apt-get clean
RUN rm /elasticsearch-${ES_VERISON_MINOR}.tar.gz

RUN echo "elasticsearch - nofile 65535" >> /etc/security/limits.conf \
  && echo "elasticsearch - memlock unlimited" >> /etc/security/limits.conf \
  && echo "MAX_OPEN_FILES=65535"  >> /etc/default/elasticsearch \
  && echo "MAX_LOCKED_MEMORY=unlimited"  >> /etc/default/elasticsearch 


# Copy of run script
COPY run.sh /
RUN chmod +x /run.sh



# add a time stamp
COPY set-time.sh /
RUN chmod +x /set-time.sh 
RUN ./set-time.sh


VOLUME  ["/es","/data","/es/conf", "/work","/es/logs","/es/plugins"]


EXPOSE  9200 9300

CMD ["./run.sh"]

