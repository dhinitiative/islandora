#!/bin/bash

#
# this script will import a collection from a directory of xml objects
# it takes one argument of the directory to ingest the objects from

. ../etc/env.sh
. ../etc/database.sh

INGEST_DIR=$1
LOG_FILE=${FEDORA_HOME}/server/logs/fedora-batch-ingest.log

echo "Starting fedora ingest on `date`" 2>&1 | tee $LOG_FILE

for object in `ls -1 ${INGEST_DIR}`;
do
	echo "Starting batch ingest of objects...." 2>&1 | tee $LOG_FILE
	echo "" 2>&1 | tee $LOG_FILE
	${FEDORA_HOME}/client/bin/fedora-batch-ingest.sh $INGEST_DIR $LOG_FILE text info:fedora/fedora-system:FOXML-1.1 ${FULL_SERVER_NAME} 8080 ${FEDORA_ADMIN_USER} ${FEDORA_ADMIN_PASS} http 2>&1 | tee $LOG_FILE
	echo "" 2>&1 | tee $LOG_FILE
	echo "Done ingesting obects" 2>&1 | tee $LOG_FILE
	echo "" 2>&1 | tee $LOG_FILE
done

echo "" 2>&1 | tee $LOG_FILE
echo "Finished fedora batch ingest on `date`" 2>&1 | tee $LOG_FILE
