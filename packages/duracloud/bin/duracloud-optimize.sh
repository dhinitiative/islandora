#!/bin/bash
   
. ../etc/duracloud.config

echo "Starting on:  `date`" >> $DURACLOUD_HOME/logs/duracloud-optimize.log


java -jar ${DURACLOUD_HOME}/lib/syncoptimize-3.2.0-driver.jar \
-h ${DURACLOUD_HOST} \
-s ${DURACLOUD_SPACE} \
-u ${DURACLOUD_USER} 2>&1 | tee $DURACLOUD_HOME/logs/duracloud-optimize.log


echo "Finished on:  `date`" >> $DURACLOUD_HOME/logs/duracloud-optimize.log
