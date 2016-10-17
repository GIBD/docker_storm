FROM gibdfrcu/storm:alpine

MAINTAINER Ramiro Rivera <ramarivera@gmail.com>

RUN /usr/bin/config-supervisord.sh nimbus && \
	/usr/bin/config-supervisord.sh drpc

EXPOSE 6627
EXPOSE 3772
EXPOSE 3773

COPY ["start-supervisor.sh", "/usr/bin/"]

CMD /usr/bin/start-supervisor.sh
