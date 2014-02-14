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


INSTALL_CMD="install:"
UNINSTALL_CMD="uninstall:"

for DIR in bin etc include info lib man sbin share
do
	for DIR_CONTENTS in `ls`
	do
		if [ $DIR_CONTENTS == $DIR ]; then
			INSTALL_CMD="$INSTALL_CMD install-$DIR"
			UNINSTALL_CMD="$UNINSTALL_CMD uninstall-$DIR"
		fi	
	done
done
echo $INSTALL_CMD
echo $UNINSTALL_CMD

cp ../Makefile .

sed -i "s/INSTALL_PACKAGE_COMMAND/$INSTALL_CMD/" ./Makefile
sed -i "s/UNINSTALL_PACKAGE_COMMAND/$UNINSTALL_CMD/" ./Makefile
