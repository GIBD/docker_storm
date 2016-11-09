FROM gibdfrcu/base:alpine

MAINTAINER Ramiro Rivera <ramarivera@gmail.com>

ENV STORM_VERSION="1.0.0" \
	SUPERVISOR_VERSION="3.3.0" \
	MAVEN_VERSION="3.3.9" 

ENV	SUPERVISORD_CONF="/etc/supervisord.conf" \
	SUPERVISORD_D_CONF="/etc/supervisord.d" \
	\
	STORM_HOME="/opt/apache-storm-${STORM_VERSION}" \
	\
	M2_HOME="/opt/apache-maven-${MAVEN_VERSION}" \
	MAVEN_OPTS="-Xms256m -Xmx512m"

ENV M2="${M2_HOME}/bin"
ENV PATH="${M2}:${PATH}"

RUN wget -q -O - http://mirrors.sonic.net/apache/storm/apache-storm-${STORM_VERSION}/apache-storm-${STORM_VERSION}.tar.gz | tar -xzf - -C /opt && \
	wget -q -O - http://mirrors.dcarsat.com.ar/apache/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz | tar -xzf - -C /opt 

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