#!/bin/bash
   
. ../etc/duracloud.config

echo "Starting on:  `date`" >> $DURACLOUD_HOME/logs/duracloud-sync.log

java -jar ${DURACLOUD_HOME}/lib/duracloudsync-3.2.1.jar -x -d \
-t ${DURACLOUD_THREADS} \
-c ${DURACLOUD_CONTENT} \
-e ${DURACLOUD_EXCLUDE} \
-w ${DURACLOUD_WORK}/duracloud-sync-work \
-h ${DURACLOUD_HOST} \
-s ${DURACLOUD_SPACE} \
-u ${DURACLOUD_USER}  2>&1 | tee $DURACLOUD_HOME/logs/duracloud-sync.log

echo "Finished on:  `date`" >> $DURACLOUD_HOME/logs/duracloud-sync.log
