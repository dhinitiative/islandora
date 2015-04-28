#!/bin/bash

# This script will create a $ISLANDORA_HOME/etc/namespaces.conf with all the collections that have pids like  namespace:root
# as well as print the list to the screen

. ../etc/env.sh
. ../etc/database.sh

${FEDORA_HOME}/client/bin/fedora-find.sh ${FULL_SERVER_NAME} 8080 {$FEDORA_ADMIN_USER} ${FEDORA_ADMIN_PASS} "pid" "*:root" http | grep pid | awk '{print $2}' > ${ISLANDORA_HOME}/etc/namespaces.conf
cat ${ISLANDORA_HOME}/etc/namespaces.conf
