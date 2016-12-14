FROM gibdfrcu/storm_base:alpine_0.10.2


MAINTAINER Ramiro Rivera <ramarivera@gmail.com>


COPY ["start-supervisor.sh", "/usr/bin/"]


EXPOSE 6627
EXPOSE 3772
EXPOSE 3773


RUN /usr/bin/config-supervisord.sh nimbus && \
	/usr/bin/config-supervisord.sh drpc && \
	chmod +x /usr/bin/start-supervisor.sh


CMD /usr/bin/start-supervisor.sh
