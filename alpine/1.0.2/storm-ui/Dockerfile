FROM gibdbigdata/storm:alpine_jdk1.8_1.0.2


MAINTAINER Ramiro Rivera <ramarivera@gmail.com>


EXPOSE 8080


RUN /usr/bin/config-supervisord.sh ui


CMD /usr/bin/start-supervisor.sh