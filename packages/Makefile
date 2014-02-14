# Copyright (c) 1991 Bell Communications Research, Inc. (Bellcore)
#
# Permission to use, copy, modify, and distribute this material
# for any purpose and without fee is hereby granted, provided
# that the above copyright notice and this permission notice
# appear in all copies, and that the name of Bellcore not be
# used in advertising or publicity pertaining to this
# material without the specific, prior written permission
# of an authorized representative of Bellcore.  BELLCORE
# MAKES NO REPRESENTATIONS ABOUT THE ACCURACY OR SUITABILITY
# OF THIS MATERIAL FOR ANY PURPOSE.  IT IS PROVIDED "AS IS",
# WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
#
#
# Swiped from the metamail distribution and modified by Glenn Malling 5/2/96
#
# Copy it to <product>/<release> and rename it to Makefile.
# Add sections to handle directories in addition to bin, lib, include,
# and man if necessary. -gam
#
# Addendum's 
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

RM = rm

# How to copy files
CP = cp

#
# When making symbolic links in ${INSTROOT}/bin
INSTALL = ln -s

# Root of installation tree.  Different macro name in case it is not
# the same as MANROOT.  E.g. installing links in /usr/local/X11/bin.
# ROOTs are set to /tmp/local to insure that the believers in magic
# do as little damage as possible.

BINROOT   = /opt/islandora
ETCROOT   = /opt/islandora
INCROOT   = /opt/islandora
INFOROOT  = /opt/islandora
LIBROOT   = /opt/islandora
MANROOT   = /opt/islandora
SBINROOT  = /opt/islandora
SHAREROOT = /opt/islandora
#
# This is where binaries should be copied
BINDIR = ${BINROOT}/bin

# This is where system binary files go.
ETCDIR = ${ETCROOT}/etc

# This is where header files should be copied.
INCDIR = ${INCROOT}/include

# This is where info files should be copied.
INFODIR = ${INFOROOT}/info

# This is where library files go
LIBDIR = ${LIBROOT}/lib

# This is where man pages should be copied, and their extensions
MANDIR = ${MANROOT}/man

# This is where system binary files go.
SBNDIR = ${SBINROOT}/sbin

# This is where share files should be copied, and their extensions
SHAREDIR = ${SHAREROOT}/share

#install: install-bin install-etc install-include install-info install-lib install-man install-sbin install-share
INSTALL_PACKAGE_COMMAND

install-bin:
	@(linkup () { cd $$1;			\
	mkdir -p $$2;				\
	for file in *; do			\
	  if [ "$$file" = '*' ]; then break; fi;\
	  if [ -d $$file ]; then linkup $$file $$2/$$file;\
	    else target=$$2/$$file; 		\
	    echo "installing binary $$target";	\
	    if [ -f $$target ]; then mv $$target $$target.old; fi;\
	    ${INSTALL} `pwd`/$$file $$target;	\
	  fi;					\
	done; cd ..; };				\
	linkup bin ${BINDIR};)

install-sbin:
	@(linkup () { cd $$1;			\
	mkdir -p $$2;				\
	for file in *; do			\
	  if [ "$$file" = '*' ]; then break; fi;\
	  if [ -d $$file ]; then linkup $$file $$2/$$file;\
	    else target=$$2/$$file;		\
	    echo "installing system binary $$target";\
	    if [ -f $$target ]; then mv $$target $$target.old; fi;\
	    ${INSTALL} `pwd`/$$file $$target;	\
	  fi;					\
	done; cd ..; };				\
	linkup sbin ${SBNDIR};)

install-lib:
	@(linkup () { cd $$1;			\
	mkdir -p $$2;				\
	for file in *; do			\
	  if [ "$$file" = '*' ]; then break; fi;\
	  if [ -d $$file ]; then linkup $$file $$2/$$file;\
	    else target=$$2/$$file;		\
	    echo "installing library $$target";	\
	    if [ -f $$target ]; then mv $$target $$target.old; fi;\
	    ${INSTALL} `pwd`/$$file $$target;	\
	  fi;					\
	done; cd ..; };				\
	linkup lib ${LIBDIR};)

install-etc:
	@(linkup () { cd $$1;			\
	mkdir -p $$2;				\
	for file in *; do			\
	  if [ "$$file" = '*' ]; then break; fi;\
	  if [ -d $$file ]; then linkup $$file $$2/$$file;\
	    else target=$$2/$$file;		\
	    echo "installing support file $$target";	\
	    if [ -f $$target ]; then mv $$target $$target.old; fi;\
	    ${INSTALL} `pwd`/$$file $$target;	\
	  fi;					\
	done; cd ..; };				\
	linkup etc ${ETCDIR};)

install-include:
	@(linkup () { cd $$1;			\
	mkdir -p $$2;				\
	for file in *; do			\
	  if [ "$$file" = '*' ]; then break; fi;\
	  if [ -d $$file ]; then linkup $$file $$2/$$file;\
	    else target=$$2/$$file;		\
	    echo "installing header $$target";	\
	    if [ -f $$target ]; then mv $$target $$target.old; fi;\
	    ${INSTALL} `pwd`/$$file $$target;	\
	  fi;					\
	done; cd ..; };				\
	linkup include ${INCDIR};)

install-man:
	@(linkup () { cd $$1;			\
	mkdir -p $$2;				\
	for file in *; do			\
	  if [ "$$file" = '*' ]; then break; fi;\
	  if [ -d $$file ]; then linkup $$file $$2/$$file;\
	    else target=$$2/$$file;		\
	    echo "installing man page $$target";\
	    if [ -f $$target ]; then mv $$target $$target.old; fi;\
	    ${INSTALL} `pwd`/$$file $$target;	\
	  fi;					\
	done; cd ..; };				\
	linkup man ${MANDIR};)

install-info:
	@(linkup () { cd $$1;			\
	mkdir -p $$2;				\
	for file in *; do			\
	  if [ "$$file" = '*' ]; then break; fi;\
	  if [ -d $$file ]; then linkup $$file $$2/$$file;\
	    else target=$$2/$$file;		\
	    echo "installing info file $$target";\
	    if [ -f $$target ]; then mv $$target $$target.old; fi;\
	    ${INSTALL} `pwd`/$$file $$target;	\
	  fi;					\
	done; cd ..; };				\
	linkup info ${INFODIR};)

install-share:
	@(linkup () { cd $$1;			\
	mkdir -p $$2;				\
	for file in *; do			\
	  if [ "$$file" = '*' ]; then break; fi;\
	  if [ -d $$file ]; then linkup $$file $$2/$$file;\
	    else target=$$2/$$file;		\
	    echo "installing share file $$target";\
	    if [ -f $$target ]; then mv $$target $$target.old; fi;\
	    ${INSTALL} `pwd`/$$file $$target;	\
	  fi;					\
	done; cd ..; };				\
	linkup share ${SHAREDIR};)

#uninstall: uninstall-bin uninstall-etc uninstall-include uninstall-info uninstall-lib uninstall-man uninstall-sbin uninstall-share
UNINSTALL_PACKAGE_COMMAND

uninstall-bin:
	@(unlink () { cd $$1;			\
	for file in *; do			\
	  if [ "$$file" = '*' ]; then break; fi;\
	  if [ -d $$file ]; then unlink $$file $$2/$$file;\
	    else target=$$2/$$file;		\
	    echo "rm-ing binary $$target";	\
	    if [ -h $$target ]; then ${RM} $$target; fi;\
	    if [ -f $$target.old ]; then mv $$target.old $$target; fi;\
	  fi;					\
	done; cd ..; };				\
	unlink bin ${BINDIR};)

uninstall-sbin:
	@(unlink () { cd $$1;			\
	for file in *; do			\
	  if [ "$$file" = '*' ]; then break; fi;\
	  if [ -d $$file ]; then unlink $$file $$2/$$file;\
	    else target=$$2/$$file;		\
	    echo "rm-ing system binary $$target";\
	    if [ -h $$target ]; then ${RM} $$target; fi;\
	    if [ -f $$target.old ]; then mv $$target.old $$target; fi;\
	  fi;					\
	done; cd ..; };				\
	unlink sbin ${SBNDIR};)

uninstall-lib:
	@(unlink () { cd $$1;			\
	for file in *; do			\
	  if [ "$$file" = '*' ]; then break; fi;\
	  if [ -d $$file ]; then unlink $$file $$2/$$file;\
	    else target=$$2/$$file;		\
	    echo "rm-ing library $$target";	\
	    if [ -h $$target ]; then ${RM} $$target; fi;\
	    if [ -f $$target.old ]; then mv $$target.old $$target; fi;\
	  fi;					\
	done; cd ..; };				\
	unlink lib ${LIBDIR};)

uninstall-etc:
	@(unlink () { cd $$1;			\
	for file in *; do			\
	  if [ "$$file" = '*' ]; then break; fi;\
	  if [ -d $$file ]; then unlink $$file $$2/$$file;\
	    else target=$$2/$$file;		\
	    echo "rm-ing support file $$target";	\
	    if [ -h $$target ]; then ${RM} $$target; fi;\
	    if [ -f $$target.old ]; then mv $$target.old $$target; fi;\
	  fi;					\
	done; cd ..; };				\
	unlink etc ${ETCDIR};)

uninstall-include:
	@(unlink () { cd $$1;			\
	for file in *; do			\
	  if [ "$$file" = '*' ]; then break; fi;\
	  if [ -d $$file ]; then unlink $$file $$2/$$file;\
	    else target=$$2/$$file;		\
	    echo "rm-ing header $$target";	\
	    if [ -h $$target ]; then ${RM} $$target; fi;\
	    if [ -f $$target.old ]; then mv $$target.old $$target; fi;\
	  fi;					\
	done; cd ..; };				\
	unlink include ${INCDIR};)

uninstall-man:
	@(unlink () { cd $$1;			\
	for file in *; do			\
	  if [ "$$file" = '*' ]; then break; fi;\
	  if [ -d $$file ]; then unlink $$file $$2/$$file;\
	    else target=$$2/$$file;		\
	    echo "rm-ing man page $$target";	\
	    if [ -h $$target ]; then ${RM} $$target; fi;\
	    if [ -f $$target.old ]; then mv $$target.old $$target; fi;\
	  fi;					\
	done; cd ..; };				\
	unlink man ${MANDIR};)

uninstall-info:
	@(unlink () { cd $$1;			\
	for file in *; do			\
	  if [ "$$file" = '*' ]; then break; fi;\
	  if [ -d $$file ]; then unlink $$file $$2/$$file;\
	    else target=$$2/$$file;		\
	    echo "rm-ing info file $$target";	\
	    if [ -h $$target ]; then ${RM} $$target; fi;\
	    if [ -f $$target.old ]; then mv $$target.old $$target; fi;\
	  fi;					\
	done; cd ..; };				\
	unlink info ${INFODIR};)

uninstall-share:
	@(unlink () { cd $$1;			\
	for file in *; do			\
	  if [ "$$file" = '*' ]; then break; fi;\
	  if [ -d $$file ]; then unlink $$file $$2/$$file;\
	    else target=$$2/$$file;		\
	    echo "rm-ing share file $$target";	\
	    if [ -h $$target ]; then ${RM} $$target; fi;\
	    if [ -f $$target.old ]; then mv $$target.old $$target; fi;\
	  fi;					\
	done; cd ..; };				\
	unlink share ${SHAREDIR};)

