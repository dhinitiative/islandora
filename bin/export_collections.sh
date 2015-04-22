#!/bin/bash

#
# this script will export all the collections with each collection being in a directory named for the collection
# it takes one argument of the directory to export the objects to

. ../etc/env.sh
. ../etc/database.sh

EXPORT_DIR=$1

echo "Found the following Namespaces:"
echo ""
${ISLANDORA_HOME}/bin/get_namespaces.sh

for namespace in `cat ${ISLANDORA_HOME}/etc/namespaces.conf`;
do
	collection=`echo $namespace | awk -F: '{print $1}'`
	echo "Exporting Collection: $collection"
	echo ""
	mkdir $EXPORT_DIR/$collection
	for pid in `${ISLANDORA_HOME}/bin/find_pids.sh $collection`;
	do
		${FEDORA_HOME}/client/bin/fedora-export.sh ${FULL_SERVER_NAME} 8080 {$FEDORA_ADMIN_USER} ${FEDORA_ADMIN_PASS} $collection info:fedora/fedora-system:FOXML-1.1 archive $EXPORT_DIR/$collection http
	done
	echo ""
	echo "Done exporting $collection"
	echo ""
done
