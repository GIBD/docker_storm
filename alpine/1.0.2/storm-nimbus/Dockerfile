<<<<<<< HEAD:alpine/1.0.2/storm-nimbus/Dockerfile
FROM gibdfrcu/storm:alpine_jdk1.8.112_1.0.2

=======
FROM gibdfrcu/storm_base:alpine_1.0.2
>>>>>>> a0322a0aa18e3a9c4c230a618bd5975e08b11d87:alpine/1.0.2/storm-nimbus/Dockerfile

MAINTAINER Ramiro Rivera <ramarivera@gmail.com>


COPY ["start-supervisor.sh", "/usr/bin/"]


EXPOSE 6627
EXPOSE 3772
EXPOSE 3773


RUN /usr/bin/config-supervisord.sh nimbus && \
	/usr/bin/config-supervisord.sh drpc && \
	chmod +x /usr/bin/start-supervisor.sh


CMD /usr/bin/start-supervisor.sh
