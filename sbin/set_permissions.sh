#!/bin/bash -x

# Islandora Software Installation Framework (ISIF)
# by Steve Young (SLY), Hamilton College 2014
#
# is licensed under a Creative Commons Attribution 4.0 International License.
# Based on a work at http://github.com/hamhpc/islandora.git.
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

# set ownership
chown -R ${FEDORA_USER}:${FEDORA_USER} ${ISLANDORA_HOME}
chown -R ${FEDORA_USER}:${FEDORA_USER} ${FEDORA_HOME}
chown -R ${FEDORA_USER}:${FEDORA_USER} ${DRUPAL_ROOT}
chown -R ${FEDORA_USER}:${FEDORA_USER} ${SOLR_HOME}

# set permissions
chmod -R 755 ${ISLANDORA_HOME} 
#chmod -R 755 ${FEDORA_HOME} 
chmod 755 /etc/init.d/fedora
chmod -R 640 ${ISLANDORA_HOME}/etc
chmod 755 ${ISLANDORA_HOME}/etc
chmod -R 644 ${ISLANDORA_HOME}/etc/env.sh
chmod -R 755 $DRUPAL_ROOT
chmod -R 775 $DRUPAL_ROOT/sites/default/files
