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

if [ ! $1 ]
then
        echo "" 2>&1 | tee -a $LOG_FILE
        echo "***Error: missing export directory argument***" 2>&1 | tee -a $LOG_FILE
        echo "" 2>&1 | tee -a $LOG_FILE
else
	if [ ! $2 ]
	then
		echo "" 2>&1 | tee -a $LOG_FILE
        	echo "***Error: missing collection name argument 2***" 2>&1 | tee -a $LOG_FILE
        	echo "" 2>&1 | tee -a $LOG_FILE
        else
		echo "Starting fedora export on `date`" 2>&1 | tee -a $LOG_FILE
		echo "Exporting Collection: $COLLECTION" 2>&1 | tee -a $LOG_FILE
		echo "" 2>&1 | tee -a $LOG_FILE
		if [ -d $EXPORT_DIR/$collection ]
                then
                        echo -n "Directory $EXPORT_DIR/$collection exists...." 2>&1 | tee -a $LOG_FILE
                else
                        echo -n "Creating directory $EXPORT_DIR/$collection ...." 2>&1 | tee -a $LOG_FILE
                        mkdir -p $EXPORT_DIR/$collection 2>&1 | tee -a $LOG_FILE
                fi
                echo "Done." 2>&1 | tee -a $LOG_FILE
                
		for pid in `${ISLANDORA_HOME}/bin/find_pids.sh $collection`;
                do
                        filename=`echo $pid | sed 's|:|_|g'`
                        if [ -f $EXPORT_DIR/$collection/$filename.xml ]
                        then
                                echo "$EXPORT_DIR/$collection/$filename.xml already exists" 2>&1 | tee -a $LOG_FILE
                                echo "" 2>&1 | tee -a $LOG_FILE
                        else
                                ${FEDORA_HOME}/client/bin/fedora-export.sh ${FULL_SERVER_NAME}:8080 ${FEDORA_ADMIN_USER} ${FEDORA_ADMIN_PASS} $pid info:fedora/fedora-system:FOXML-1.1 archive $EXPORT_DIR/$collection http 2>&1 | tee -a $LOG_FILE
                        fi
                done
		echo "" 2>&1 | tee -a $LOG_FILE
		echo "Done exporting $COLLECTION" 2>&1 | tee -a $LOG_FILE
		echo "" 2>&1 | tee -a $LOG_FILE
	fi
	echo "" 2>&1 | tee -a $LOG_FILE
	echo "Finished fedora collection export: $COLLECTION on `date`" 2>&1 | tee -a $LOG_FILE
fi
