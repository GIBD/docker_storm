#!/bin/sh

docker 	run -it \
		--link stormdocker_nimbus_1:nimbus \
		-p 22 \
		wurstmeister/storm /bin/bash