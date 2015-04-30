#!/bin/bash

#
# this script will import a collection from a directory of xml objects
# it takes one argument of the directory to ingest the objects from

. /opt/islandora/etc/env.sh
. /opt/islandora/etc/database.sh

INGEST_DIR=$1
LOG_FILE=${FEDORA_HOME}/server/logs/fedora-ingest.log

echo "Starting fedora directory ingest on `date`" 2>&1 | tee -a $LOG_FILE
echo "" 2>&1 | tee -a $LOG_FILE

${FEDORA_HOME}/client/bin/fedora-ingest.sh d $INGEST_DIR info:fedora/fedora-system:FOXML-1.1 ${FULL_SERVER_NAME}:8080 ${FEDORA_ADMIN_USER} ${FEDORA_ADMIN_PASS} http 2>&1 | tee -a $LOG_FILE

echo "" 2>&1 | tee -a $LOG_FILE
echo "Finished fedora directory ingest on `date`" 2>&1 | tee -a $LOG_FILE
