#!/bin/bash
# Islandora Software Installation Framework (ISIF)
# by Steve Young (SLY), Hamilton College 2014
#
# is licensed under a Creative Commons Attribution 4.0 International License.
# http://creativecommons.org/licenses/by/4.0/deed.en_US
# Based on a work at http://github.com/dhinitiative/islandora.git.
# Permissions beyond the scope of this license may be available at http://www.hamilton.edu.

#
# Revisions
#
# 2/5/2014 - SLY - Initial Creation


#---------------------------------------------
#
# Script to initialize the islandora settings 
# files etc/env.sh and etc/database.sh
#
#---------------------------------------------
#

sed -i "s|FEDORA_HOME_TO_CHANGE|$FEDORA_HOME|g" ../etc/env.sh
sed -i "s/FEDORA_USER_TO_CHANGE/$FEDORA_USER/g" ../etc/env.sh
sed -i "s/FEDORA_VERSION_TO_CHANGE/$FEDORA_VERSION/g" ../etc/env.sh
sed -i "s|ISLANDORA_HOME_TO_CHANGE|$ISLANDORA_HOME|g" ../etc/env.sh
sed -i "s|ISLANDORA_HOME_TO_CHANGE|$ISLANDORA_HOME|g" ../etc/init.d-fedora
sed -i "s|SOLR_HOME_TO_CHANGE|$SOLR_HOME|g" ../etc/env.sh
sed -i "s|SOLR_VERSION_TO_CHANGE|$SOLR_VERSION|g" ../etc/env.sh
sed -i "s|JAVA_HOME_TO_CHANGE|$JAVA_HOME|g" ../etc/env.sh
sed -i "s|GSEARCH_VERSION_TO_CHANGE|$GSEARCH_VERSION|g" ../etc/env.sh

sed -i "s/DATABASE_SERVER_TO_CHANGE/$DB_SERVER/g" ../etc/database.sh
sed -i "s/FULL_SERVER_NAME_TO_CHANGE/$SERVER_FULL_NAME/g" ../etc/database.sh
sed -i "s/SERVER_NAME_TO_CHANGE/$SERVER_NAME/g" ../etc/database.sh
sed -i "s/ADMIN_EMAIL_TO_CHANGE/$ADMIN_EMAIL/g" ../etc/database.sh
sed -i "s|DRUPAL_ROOT_TO_CHANGE|$DRUPAL_ROOT|g" ../etc/database.sh
sed -i "s/DRUPAL_DB_NAME_TO_CHANGE/$DRUPAL_DB_NAME/g" ../etc/database.sh
sed -i "s/DRUPAL_DB_USER_TO_CHANGE/$DRUPAL_DB_USER/g" ../etc/database.sh
sed -i "s/DRUPAL_DB_PASS_TO_CHANGE/$DRUPAL_DB_PASS/g" ../etc/database.sh
sed -i "s/DRUPAL_ADMIN_USER_TO_CHANGE/$DRUPAL_ADMIN_USER/g" ../etc/database.sh
sed -i "s/DRUPAL_ADMIN_PASS_TO_CHANGE/$DRUPAL_ADMIN_PASS/g" ../etc/database.sh
sed -i "s/DRUPAL_SITE_NAME_TO_CHANGE/$DRUPAL_SITE_NAME/g" ../etc/database.sh
sed -i "s/DRUPAL_DB_PREFIX_TO_CHANGE/$DRUPAL_DB_PREFIX/g" ../etc/database.sh
sed -i "s/FEDORA_DB_NAME_TO_CHANGE/$FEDORA_DB_NAME/g" ../etc/database.sh
sed -i "s/FEDORA_DB_USER_TO_CHANGE/$FEDORA_DB_USER/g" ../etc/database.sh
sed -i "s/FEDORA_DB_PASS_TO_CHANGE/$FEDORA_DB_PASS/g" ../etc/database.sh
sed -i "s/FEDORA_ADMIN_USER_TO_CHANGE/$FEDORA_ADMIN_USER/g" ../etc/database.sh
sed -i "s/FEDORA_ADMIN_PASS_TO_CHANGE/$FEDORA_ADMIN_PASS/g" ../etc/database.sh
sed -i "s/FGSADMIN_USER_TO_CHANGE/$FEDORA_GSEARCH_ADMIN_USER/g" ../etc/database.sh
sed -i "s/FGSADMIN_PASS_TO_CHANGE/$FEDORA_GSEARCH_ADMIN_PASS/g" ../etc/database.sh
