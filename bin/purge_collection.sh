#!/bin/bash

#
# this script will purge a collection
# it takes one argument:
# 1st - namespace to purge


. ../etc/env.sh
. ../etc/database.sh

COLLECTION=$1
LOG_FILE=${FEDORA_HOME}/server/logs/fedora-purge.log

if [ ! $1 ]
then
  echo "" 2>&1 | tee -a $LOG_FILE
  echo "***Error: missing collection to purge argument***" 2>&1 | tee -a $LOG_FILE
  echo "" 2>&1 | tee -a $LOG_FILE
else
	echo "Starting fedora purge on `date`" 2>&1 | tee -a $LOG_FILE
	echo "Purging Collection: $COLLECTION" 2>&1 | tee -a $LOG_FILE
	echo "" 2>&1 | tee -a $LOG_FILE
	for pid in `${ISLANDORA_HOME}/bin/find_pids.sh $COLLECTION`;
  do
    ${FEDORA_HOME}/client/bin/fedora-purge.sh ${FULL_SERVER_NAME} 8080 ${FEDORA_ADMIN_USER} ${FEDORA_ADMIN_PASS} $pid http "" 2>&1 | tee -a $LOG_FILE
  done
	echo "" 2>&1 | tee -a $LOG_FILE
	echo "Done purging $COLLECTION" 2>&1 | tee -a $LOG_FILE
	echo "" 2>&1 | tee -a $LOG_FILE
	echo "" 2>&1 | tee -a $LOG_FILE
	echo "Finished purging fedora collection: $COLLECTION on `date`" 2>&1 | tee -a $LOG_FILE
fi
