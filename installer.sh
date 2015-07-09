##!/bin/bash
#
# Script to automatically install Drupal, Fedora Commons, and Islandora Modules
#

# Assumptions:
#
#  - Databases are created in MySQL and you have DB names, users, and passwords for them. 
#     ( one for Fedora Commons and one for Drupal )
#
# - Make sure you set the usernames and passwords for the environment variables below. 
#     Then run the installer.sh script to complete the installation of fedora commons. 
#    % chmod 750 installer.sh; ./installer.sh

#---------------------------------------------
#
# Variable Declaration (edit for your setup)
#
#---------------------------------------------
#
#
## Set up installation variables  (CHANGE THESE BEFORE RUNNING THIS SCRIPT)
#
export SERVER_NAME=fedora                          # set server short name
export SERVER_FULL_NAME='fedora.somedomain.com'    # set server full name
export ADMIN_EMAIL='youremail@domain.com'          # enter your email address to get messages from the server
export INSTALL_PREFIX=`pwd`
export WEB_ROOT=/var/www/html
export IP_ADDR="xxx.xxx.xxx.xxx"                   # IP address of this server (ifconfig -a). 
export SITES_ALL_MODULES=$WEB_ROOT/sites/all/modules
export SITES_ALL_LIB=$WEB_ROOT/sites/all/libraries
export FEDORA_VERSION="3.8"                        # Valid versions 3.5 and 3.8
export SOLR_VERSION="4.2.0"                        # Valid versions 3.6.2 and 4.2.0
export GSEARCH_VERSION="2.6"	                     # Valid versions 2.4.2 and 2.6
export DJATOKA_VERSION="adore"                     # Valid versions freelib or adore
export DURACLOUD="No"                              # Install duracloud
#
## Variables to be passed to env.sh
export FEDORA_HOME=$INSTALL_PREFIX/fedora
export FEDORA_USER=fedora
export FEDORA_USER_PASS='fedora2014'
export ISLANDORA_HOME=$INSTALL_PREFIX
export SOLR_HOME=$INSTALL_PREFIX/solr
export JAVA_HOME=${INSTALL_PREFIX}/java
#
## Variables to be passed to database.sh
#
# Note: be careful using regular expression characters in passwords. Be sure to escape them
#
export INSTALL_MYSQL="Yes"                          # Yes or No for installing Mysqld locally on machine
# EDIT changed Root MySQL to hpc root pass. 
export ROOT_MYSQL_PASS='mysqlroot'                  # If Yes to installing MySQL set the root user password
export DB_SERVER=localhost
export INSTALL_DRUPAL="No"
export INSTALL_ISLANDORA="No"
export DRUPAL_ROOT=$WEB_ROOT		                    # Top level of the drupal web root
export DRUPAL_DB_NAME="drupal"          	          # Drupal database name
export DRUPAL_DB_USER="drupal"          	          # Drupal db username for settings.php file
export DRUPAL_DB_PASS='drupalpass'           	      # Drupal db password for settings.php file
export DRUPAL_ADMIN_USER="IslandoraAdmin"           # Drupal admin username to log into Drupal Site
export DRUPAL_ADMIN_PASS='islandorapass'      		  # Drupal admin password to log into Drupal Site
export DRUPAL_SITE_NAME="Islandora Sandbox"         # Drupal site name - displayed on the web site
export DRUPAL_DB_PREFIX=""
export FEDORA_DB_NAME="fedora3"        		          # Name of fedora MySQL database -> fedora3 is recommended
export FEDORA_DB_USER="fedoradb"        		        # Fedora db username -> for fedora.fcfg file
export FEDORA_DB_PASS='fedoradbpass'        	      # Fedora db password -> for fedora.fcfg file
export FEDORA_ADMIN_USER="fedoraAdmin"              # Username for http://localhost:8080/fedora/admin
export FEDORA_ADMIN_PASS='fedoraadminpass'          # Password for http://localhost:8080/fedora/admin
export FEDORA_GSEARCH_ADMIN_USER="fgsAdmin"         # Username for http://localhost:8080/fedoragsearch
export FEDORA_GSEARCH_ADMIN_PASS='fgsadminpass'     # Password for http://localhost:8080/fedoragsearch
export INSTALL_LOG=${INSTALL_PREFIX}/installation.log

# Begin CSF Firewall installation
#
# dependancies
#
yum -y install perl-IO-Socket-SSL
yum -y install perl-libwww-perl
yum -y install perl-Crypt-SSLeay perl-Net-SSLeay

#
# get the package and install it
#
cd /tmp
wget https://download.configserver.com/csf.tgz
tar -zxvf csf.tgz
cd csf 
sh install.sh

# 
# now configure it
#
sed -i 's|TESTING = "1"|TESTING = "0"|g' /etc/csf/csf.conf
sed -i 's|RESTRICT_SYSLOG = "0"|RESTRICT_SYSLOG = "3"|g' /etc/csf/csf.conf
sed -i 's|SMTP_BLOCK = "0"|SMTP_BLOCK = "0"|g' /etc/csf/csf.conf
# use the following to limit certain countries from access
# sed -i 's|CC_DENY = ""|CC_DENY = "RU,CN,GE,BR,UA,SE,TH,CL,TW"|g' /etc/csf/csf.conf
sed -i 's|SMTP_BLOCK = "0"|SMTP_BLOCK = "1"|g' /etc/csf/csf.conf
sed -i 's|LF_SCRIPT_ALERT = "0"|LF_SCRIPT_ALERT = "1"|g' /etc/csf/csf.conf
sed -i 's|SYSLOG_CHECK = "0"|SYSLOG_CHECK = "300"|g' /etc/csf/csf.conf
sed -i 's|PT_ALL_USERS = "0"|PT_ALL_USERS = "1"|g' /etc/csf/csf.conf
#
# update sshd
#
sed -i 's|#UseDNS yes|UseDNS no|g' /etc/ssh/sshd_config
#
# update php
#
sed -i 's|enable_dl = On|enable_dl = Off|g' /usr/local/lib/php.ini
#
# update mysql (per http://dev.mysql.com/doc/mysql-security-excerpt/5.0/en/load-data-local.html)
# 
#
echo "local-infile=0" >> /etc/my.cnf
#
# turn off portreserve
#
service portreserve stop
chkconfig portreserve off

/bin/rm -r /tmp/csf
/bin/rm  /tmp/csf.tgz
cd $INSTALL_PREFIX


# End CSF install

#
# Set up mail alias for root
#
sed -i s/\#root\:/root\:/ /etc/aliases
sed -i s/marc/$ADMIN_EMAIL/ /etc/aliases
newaliases


#---------------------------------------------
#
# Configure environment variables
#
#---------------------------------------------
#
cd $ISLANDORA_HOME/sbin
./initialize_env.sh    # set islandora env and Database info
. ../etc/env.sh      # source Islandora environment
. ../etc/database.sh # source Database information


#---------------------------------------------
#
# Do the installation
#
#---------------------------------------------
#
script -ac ./software_dependancies.install ${INSTALL_LOG}
script -ac ./apache.install ${INSTALL_LOG}
if [ $INSTALL_MYSQL == "Yes" ]; then
    script -ac ./mysql.install ${INSTALL_LOG}
fi
if [ $INSTALL_DRUPAL == "Yes" ]; then
script -ac ./drupal.install ${INSTALL_LOG}
fi
script -ac ./fedora.install ${INSTALL_LOG}
script -ac ./gsearch.install ${INSTALL_LOG}
script -ac ./solr.install ${INSTALL_LOG}
script -ac ./djatoka.install ${INSTALL_LOG}
if [ $DURACLOUD == "Yes" ]; then
script -ac ./duracloud.install ${INSTALL_LOG}
fi
if [ $INSTALL_ISLANDORA == "Yes" ]; then
script -ac ./islandora_modules.install ${INSTALL_LOG}
fi
script -ac ./set_permissions.sh ${INSTALL_LOG}
reboot
