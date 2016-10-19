FROM gibdfrcu/storm:alpine


MAINTAINER Ramiro Rivera <ramarivera@gmail.com>


EXPOSE 8080


RUN /usr/bin/config-supervisord.sh ui


CMD cat $STORM_HOME/conf/storm.yaml && /usr/bin/start-supervisor.sh && \
	cat $STORM_HOME/conf/storm.yaml





