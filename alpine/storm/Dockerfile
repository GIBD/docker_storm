FROM gibdfrcu/base:alpine

MAINTAINER Ramiro Rivera <ramarivera@gmail.com>

ENV STORM_VERSION="0.9.4" \
	SUPERVISOR_VERSION="3.3.0" \
	SUPERVISORD_CONF="/etc/supervisord.conf"
ENV STORM_HOME="/opt/apache-storm-${STORM_VERSION}"

COPY ["storm.yaml", "$STORM_HOME/conf/"]
COPY ["cluster.xml", "$STORM_HOME/logback/"]
COPY ["config-supervisord.sh", "start-supervisor.sh", "/usr/bin/"]


RUN wget -q -O - http://mirrors.sonic.net/apache/storm/apache-storm-${STORM_VERSION}/apache-storm-${STORM_VERSION}.tar.gz | tar -xzf - -C /opt && \
	\
	pip install supervisor==$SUPERVISOR_VERSION && \
	\
	addgroup storm && \
	adduser -D -h /home/storm -G storm -s /bin/bash  storm && \
	echo 'storm:storm' | chpasswd && \
	chown -R storm:storm $STORM_HOME && \
	mkdir /var/log/storm && \
	chown -R storm:storm /var/log/storm && \
	\
	ln -s $STORM_HOME/bin/storm /usr/bin/storm && \
	\
	chmod +x /usr/bin/start-supervisor.sh /usr/bin/config-supervisord.sh &&\
	\
	echo [supervisord] | tee -a $SUPERVISORD_CONF && \
	echo nodaemon=true | tee -a $SUPERVISORD_CONF

