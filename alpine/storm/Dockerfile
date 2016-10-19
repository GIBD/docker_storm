FROM gibdfrcu/base:alpine

MAINTAINER Ramiro Rivera <ramarivera@gmail.com>

ENV STORM_VERSION="1.0.0" \
	SUPERVISOR_VERSION="3.3.0" \
	SUPERVISORD_CONF="/etc/supervisord.conf" \
	SUPERVISORD_D_CONF="/etc/supervisord.d"

ENV STORM_HOME="/opt/apache-storm-${STORM_VERSION}"


RUN wget -q -O - http://mirrors.sonic.net/apache/storm/apache-storm-${STORM_VERSION}/apache-storm-${STORM_VERSION}.tar.gz | tar -xzf - -C /opt
RUN pip install supervisor==$SUPERVISOR_VERSION


RUN mkdir $SUPERVISORD_D_CONF && \
	\
	addgroup storm && \
	adduser -D -h /home/storm -G storm -s /bin/bash  storm && \
	echo 'storm:storm' | chpasswd && \
	chown -R storm:storm $STORM_HOME && \
	mkdir /var/log/storm && \
	chown -R storm:storm /var/log/storm && \
	\
	ln -s $STORM_HOME/bin/storm /usr/bin/storm


COPY storm.yaml $STORM_HOME/conf/
COPY cluster.xml $STORM_HOME/logback/
COPY start-supervisor.sh /usr/bin/
COPY config-supervisord.sh /usr/bin/

#RUN cat $STORM_HOME/conf/storm.yaml

RUN chmod +x /usr/bin/start-supervisor.sh /usr/bin/config-supervisord.sh  && \
	echo [supervisord] | tee -a $SUPERVISORD_CONF && \
	echo nodaemon=true | tee -a $SUPERVISORD_CONF && \
	echo [include] | tee -a $SUPERVISORD_CONF && \
	echo files=/etc/supervisord.d/*.conf | tee -a $SUPERVISORD_CONF