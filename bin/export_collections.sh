#!/bin/bash

#
# this script will export all the collections with each collection being in a directory named for the collection
# it takes one argument of the directory to export the objects to

. ../etc/env.sh
. ../etc/database.sh

EXPORT_DIR=$1
LOG_FILE=${FEDORA_HOME}/server/logs/fedora-export.log

echo "Starting fedora export on `date`" 2>&1 | tee $LOG_FILE
echo "Found the following Namespaces:" 2>&1 | tee $LOG_FILE
echo "" 2>&1 | tee $LOG_FILE
${ISLANDORA_HOME}/bin/get_namespaces.sh 2>&1 | tee $LOG_FILE

for namespace in `cat ${ISLANDORA_HOME}/etc/namespaces.conf`;
do
	collection=`echo $namespace | awk -F: '{print $1}'`
	echo "Exporting Collection: $collection" 2>&1 | tee $LOG_FILE
	echo "" 2>&1 | tee $LOG_FILE
	mkdir $EXPORT_DIR/$collection 2>&1 | tee $LOG_FILE
	for pid in `${ISLANDORA_HOME}/bin/find_pids.sh $collection`;
	do
		${FEDORA_HOME}/client/bin/fedora-export.sh ${FULL_SERVER_NAME} 8080 {$FEDORA_ADMIN_USER} ${FEDORA_ADMIN_PASS} $collection info:fedora/fedora-system:FOXML-1.1 archive $EXPORT_DIR/$collection http 2>&1 | tee $LOG_FILE
	done
	echo "" 2>&1 | tee $LOG_FILE
	echo "Done exporting $collection" 2>&1 | tee $LOG_FILE
	echo "" 2>&1 | tee $LOG_FILE
done
echo "" 2>&1 | tee $LOG_FILE
echo "Finished fedora collection export on `date`" 2>&1 | tee $LOG_FILE
