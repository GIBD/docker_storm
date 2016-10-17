FROM gibdfrcu/base:alpine

MAINTAINER Ramiro Rivera <ramarivera@gmail.com>

ENV STORM_VERSION="0.9.4" \
	SUPERVISOR_VERSION="3.3.0"
ENV STORM_HOME /opt/apache-storm-${STORM_VERSION}


RUN wget -q -O - http://mirrors.sonic.net/apache/storm/apache-storm-${STORM_VERSION}/apache-storm-${STORM_VERSION}.tar.gz | tar -xzf - -C /opt


RUN pip install supervisor==$SUPERVISOR_VERSION &&\
	\
	addgroup storm; \
	adduser -h /home/storm -G storm -s /bin/bash  storm; \
	chown -R storm:storm $STORM_HOME; \
	mkdir /var/log/storm; \
	chown -R storm:storm /var/log/storm &&\
	\
	ln -s $STORM_HOME/bin/storm /usr/bin/storm


COPY ["storm.yaml", "$STORM_HOME/conf/"]
COPY ["cluster.xml", "$STORM_HOME/logback/"]
COPY ["config-supervisord.sh", "start-supervisor.sh", "/usr/bin/"]

RUN echo [supervisord] | tee -a /etc/supervisor/supervisord.conf ; \
	echo nodaemon=true | tee -a /etc/supervisor/supervisord.conf

