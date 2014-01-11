#---------------------------------------------
#
# Database info
#
#---------------------------------------------
#
export DB_SERVER=localhost			# hostname of the MySQL server

#---------------------------------------------
#
# Drupal database info
#
#---------------------------------------------
#
export DRUPAL_ROOT=/var/www/html		# Top level of the drupal web root
export DRUPAL_DB_NAME="db_name"          	# Drupal database name
export DRUPAL_DB_USER="db_user"          	# Drupal username for settings.php file
export DRUPAL_DB_PASS="password"           	# Drupal password for settings.php file
export DRUPAL_ADMIN_USER="IslandoraAdmin"       # Drupal admin username to log into Drupal Site
export DRUPAL_ADMIN_PASS="pass"       		# Drupal admin password to log into Drupal Site
export DRUPAL_SITE_NAME="Islandora Sandbox"     # Drupal site name - displayed on the web site
export DRUPAL_DB_PREFIX="drup_"			# Drupal database prefix

#---------------------------------------------
#
# Fedora database info
#
#---------------------------------------------
#
export FEDORA_DB_NAME="fedora3"        		# Name of fedora MySQL database -> fedora3 is recommeneded
export FEDORA_DB_USER="db_user"        		# Fedora db username -> for fedora.fcfg file
export FEDORA_DB_PASS="passwordd"         	# Fedora db password -> for fedora.fcfg file
export FEDORA_ADMIN_USER="fedoraAdmin"          # Username for http://localhost:8080/fedora/admin
export FEDORA_ADMIN_PASS="password"          	# Password for http://localhost:8080/fedora/admin
