#!/bin/bash
   
. ../etc/duracloud.config

java -jar ${DURACLOUD_HOME}/lib/syncoptimize-3.2.0-driver.jar \
-h ${DURACLOUD_HOST} \
-s ${DURACLOUD_SPACE} \
-u ${DURACLOUD_USER} >> ${DURACLOUD_HOME}/logs/duracloud-optimize.log 2>&1 &
