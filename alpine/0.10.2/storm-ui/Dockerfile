FROM gibdfrcu/storm:alpine_jdk1.8.112_0.10.2


MAINTAINER Ramiro Rivera <ramarivera@gmail.com>


EXPOSE 8080


RUN /usr/bin/config-supervisord.sh ui


CMD /usr/bin/start-supervisor.sh