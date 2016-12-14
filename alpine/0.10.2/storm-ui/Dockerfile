FROM gibdfrcu/storm_base:alpine_0.10.2


MAINTAINER Ramiro Rivera <ramarivera@gmail.com>


EXPOSE 8080


RUN /usr/bin/config-supervisord.sh ui


CMD /usr/bin/start-supervisor.sh