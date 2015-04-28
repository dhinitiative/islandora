#!/bin/bash

#
# this script will find all the pid's of a collection. It takes one argument, the namespace
# For example a namespace of "namespace:root"
# ./find_pids.sh namespace

. ../etc/env.sh
. ../etc/database.sh

${FEDORA_HOME}/client/bin/fedora-find.sh ${FULL_SERVER_NAME} 8080 ${FEDORA_ADMIN_USER} ${FEDORA_ADMIN_PASS} "pid" "$1:*" http | grep pid | awk '{print $2}'
