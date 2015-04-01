#!/bin/bash
   
. ../etc/duracloud.config

java -jar ${DURACLOUD_HOME}/lib/retrievaltool-3.2.0-driver.jar \
-t ${DURACLOUD_THREADS} \
-c ${DURACLOUD_CONTENT} \
-w ${DURACLOUD_WORK}/duracloud-retrieve-work \
-h ${DURACLOUD_HOST} \
-s ${DURACLOUD_SPACE} \
-u ${DURACLOUD_USER} >> ${DURACLOUD_HOME}/logs/duracloud-retrieve.log 2>&1 &
