#!/bin/bash -x

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

#
#
#
# Source environment
. ../etc/env.sh
. ../etc/database.sh


#
## Set the permissions on the whole installation
#

## Note: should put this in a loop and check if the directory exists first
# set ownership and permissions
chown -R ${FEDORA_USER}:${FEDORA_USER} ${ISLANDORA_HOME}
chown -R ${FEDORA_USER}:${FEDORA_USER} ${FEDORA_HOME}
if [ $INSTALL_DRUPAL == "Yes" ]; then
  chown -R ${FEDORA_USER}:${FEDORA_USER} ${DRUPAL_ROOT}
  chmod -R 755 $DRUPAL_ROOT
  chmod -R 775 $DRUPAL_ROOT/sites/default/files
fi
if [ $INSTALL_SOLR == "Yes" ]; then
  chown -R ${FEDORA_USER}:${FEDORA_USER} ${SOLR_HOME}
fi
chmod -R 755 ${ISLANDORA_HOME} 
#chmod -R 755 ${FEDORA_HOME} 
chmod 755 /etc/init.d/fedora
chmod -R 640 ${ISLANDORA_HOME}/etc
chmod 755 ${ISLANDORA_HOME}/etc
chmod -R 644 ${ISLANDORA_HOME}/etc/env.sh

