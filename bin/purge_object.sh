#!/bin/bash

#
# this script will purge a collection
# it takes one argument:
# 1st - object pid to purge


. ../etc/env.sh
. ../etc/database.sh

OBJECT=$1
LOG_FILE=${FEDORA_HOME}/server/logs/fedora-purge.log

if [ ! $1 ]
then
  echo "" 2>&1 | tee -a $LOG_FILE
  echo "***Error: missing pid to purge argument***" 2>&1 | tee -a $LOG_FILE
  echo "" 2>&1 | tee -a $LOG_FILE
else
	echo "Starting fedora purge object on `date`" 2>&1 | tee -a $LOG_FILE
	echo "Purging Object: $OBJECT" 2>&1 | tee -a $LOG_FILE
	echo "" 2>&1 | tee -a $LOG_FILE
  ${FEDORA_HOME}/client/bin/fedora-purge.sh ${FULL_SERVER_NAME} 8080 ${FEDORA_ADMIN_USER} ${FEDORA_ADMIN_PASS} $OBJECT http "" 2>&1 | tee -a $LOG_FILE
	echo "" 2>&1 | tee -a $LOG_FILE
	echo "Finished purging fedora object: $OBJECT on `date`" 2>&1 | tee -a $LOG_FILE
fi
