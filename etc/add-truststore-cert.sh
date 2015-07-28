#!/bin/bash

. ../etc/env.sh

PUBLIC_SITE=$1
#
# Give one argument of the public server to get and add the certificate from
#

cd $FEDORA_HOME/server

# look at truststore
$JAVA_HOME/bin/keytool -list -v -keystore truststore  -storepass tomcat

# download the certificate as a file
openssl s_client -showcerts -connect $PUBLIC_SITE:443 </dev/null 2>/dev/null|openssl x509 -outform PEM >$PUBLIC_SITE.pem

# now import the certificates into the truststore
$JAVA_HOME/bin/keytool -import -v -alias $PUBLIC_SITE -keystore truststore -storepass tomcat -file $PUBLIC_SITE.pem 
