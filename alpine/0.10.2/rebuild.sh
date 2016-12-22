#!/bin/bash

docker build -t="gibdfrcu/storm:alpine"  storm
docker build -t="gibdfrcu/storm-nimbus:alpine" storm-nimbus
docker build -t="gibdfrcu/storm-supervisor:alpine" storm-supervisor
docker build -t="gibdfrcu/storm-ui:alpine" storm-ui
