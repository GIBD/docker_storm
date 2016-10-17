#!/bin/bash

docker build -t="gibdfrcu/storm:alpine" -t="gibdfrcu/storm:latest" storm
docker build -t="gibdfrcu/storm-nimbus:alpine" -t="gibdfrcu/storm-nimbus:latest" storm-nimbus
docker build -t="gibdfrcu/storm-supervisor:alpine" -t="gibdfrcu/storm-supervisor:latest" storm-supervisor
docker build -t="gibdfrcu/storm-ui:alpine" -t="gibdfrcu/storm-ui:latest" storm-ui
