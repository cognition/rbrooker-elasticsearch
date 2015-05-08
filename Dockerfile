#FROM ubuntu:trusty
#FROM rbrooker/update-ubuntu
#FROM rbrooker/java
FROM rbrooker/es

MAINTAINER Ramon Brooker <rbrooker@aetherealmind.com>

ENV DEBIAN_FRONTEND noninteractive

# to allow supervisor to be installed 
#RUN echo exit 101 > /usr/sbin/policy-rc.d
#RUN chmod +x /usr/sbin/policy-rc.d


# for setting
ENV ES_VERSION_MAJOR=1.5
ENV ES_VERISON_MINOR=1.5.2

# install need java run time 
#RUN apt-get update && apt-get install -y openjdk-7-jre-headless 
#curl 

# get and install logstash
#ADD  https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-${ES_VERISON_MINOR}.tar.gz /  mv /elasticsearch-${ES_VERISON_MINOR} es/

# Clean up
#RUN apt-get clean
#RUN rm /elasticsearch-${ES_VERISON_MINOR}.tar.gz

# Copy of run script
COPY run.sh /
RUN chmod +x /run.sh



# add a time stamp
COPY set-time.sh /
RUN chmod +x /set-time.sh
RUN /set-time.sh


VOLUME ["/etc/elasticsearch","/var/log/elasticsearch"]


EXPOSE  9200 9300 512

CMD ["./run.sh"]

