#!/bin/bash

#
# this script will export a collection in a directory named for the collection
# it takes two arguments
# 1st - the directory to export the objects to
# 2nd - namespace of the collection

. ../etc/env.sh
. ../etc/database.sh

EXPORT_DIR=$1
COLLECTION=$2
LOG_FILE=${FEDORA_HOME}/server/logs/fedora-export.log

echo "Starting fedora export on `date`" 2>&1 | tee $LOG_FILE
echo "Exporting Collection: $COLLECTION" 2>&1 | tee $LOG_FILE
	echo "" 2>&1 | tee $LOG_FILE
	mkdir $EXPORT_DIR/$COLLECTION 2>&1 | tee $LOG_FILE
	for pid in `${ISLANDORA_HOME}/bin/find_pids.sh $COLLECTION`;
	do
		${FEDORA_HOME}/client/bin/fedora-export.sh ${FULL_SERVER_NAME} 8080 {$FEDORA_ADMIN_USER} ${FEDORA_ADMIN_PASS} $COLLECTION info:fedora/fedora-system:FOXML-1.1 archive $EXPORT_DIR/$COLLECTION http 2>&1 | tee $LOG_FILE
	done
	echo "" 2>&1 | tee $LOG_FILE
	echo "Done exporting $COLLECTION" 2>&1 | tee $LOG_FILE
	echo "" 2>&1 | tee $LOG_FILE
done
echo "" 2>&1 | tee $LOG_FILE
echo "Finished fedora collection export: $COLLECTION on `date`" 2>&1 | tee $LOG_FILE
