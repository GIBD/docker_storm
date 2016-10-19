ZOOK_IP=$(getent hosts zook | awk '{ print $1 }')
NIMB_IP=$(getent hosts nimb | awk '{ print $1 }')

sed -i -e "s/%zookeeper%/$ZOOK_IP/g" $STORM_HOME/conf/storm.yaml
sed -i -e "s/%nimbus%/$NIMB_IP/g" $STORM_HOME/conf/storm.yaml




echo "storm.local.hostname: `hostname -i`" >> $STORM_HOME/conf/storm.yaml

/usr/sbin/sshd && supervisord
