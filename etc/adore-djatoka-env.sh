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

# setup environment variables for shell script
CURRENTDIR=$CATALINA_HOME/logs
# Define DJATOKA_HOME dynamically
LAUNCHDIR=/opt/islandora/packages/adore-djatoka-1.1/bin
#cd ..
DJATOKA_HOME=/opt/islandora/packages/adore-djatoka-1.1
LIBPATH=$DJATOKA_HOME/lib
if [ `uname` = 'Linux' ] ; then
  if [ `uname -p` = "x86_64" ] ; then
    # Assume Linux AMD 64 has 64-bit Java
    PLATFORM="Linux-x86-64"
    LD_LIBRARY_PATH="$LIBPATH/$PLATFORM"
    export LD_LIBRARY_PATH
    KAKADU_LIBRARY_PATH="-DLD_LIBRARY_PATH=$LIBPATH/$PLATFORM"
  else
    # 32-bit Java
    PLATFORM="Linux-x86-32"
    LD_LIBRARY_PATH="$LIBPATH/$PLATFORM"
    export LD_LIBRARY_PATH
    KAKADU_LIBRARY_PATH="-DLD_LIBRARY_PATH=$LIBPATH/$PLATFORM"
  fi
elif [ `uname` = 'Darwin' ] ; then
  # Mac OS X
  PLATFORM="Mac-x86"
  export PATH="/System/Library/Frameworks/JavaVM.framework/Versions/1.5/Home/bin:$PATH"
  export DYLD_LIBRARY_PATH="$LIBPATH/$PLATFORM"
  KAKADU_LIBRARY_PATH="-DDYLD_LIBRARY_PATH=$LIBPATH/$PLATFORM"
elif [ `uname` = 'SunOS' ] ; then
  if [ `uname -p` = "i386" ] ; then
    # Assume Solaris x86
    PLATFORM="Solaris-x86"
    LD_LIBRARY_PATH="$LIBPATH/$PLATFORM"
    export LD_LIBRARY_PATH
  else
    # Sparcv9
    PLATFORM="Solaris-Sparcv9"
    LD_LIBRARY_PATH="$LIBPATH/$PLATFORM"
    export LD_LIBRARY_PATH
  fi
else
  echo "djatoka env: Unsupported platform: `uname`"
  exit
fi

KAKADU_HOME=$DJATOKA_HOME/bin/$PLATFORM
#cd $LAUNCHDIR

#for line in `ls -1 $LIBPATH | grep '.jar'`
  #do
  #classpath="$classpath:$LIBPATH/$line"
#done
#DEBUG="-Xdebug -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n"
#CLASSPATH=.:../build/:$classpath
#JAVA_OPTS="$DEBUG -Djava.awt.headless=true  -Xmx512M -Xms64M -Dkakadu.home=$KAKADU_HOME -Djava.library.path=$LIBPATH/$PLATFORM $KAKADU_LIBRARY_PATH"
JAVA_OPTS="$JAVA_OPTS -Djava.awt.headless=true -Dkakadu.home=$KAKADU_HOME -Djava.library.path=$LIBPATH/$PLATFORM $KAKADU_LIBRARY_PATH"

# If a proxy server is used in your institution... uncomment and set the following:
#proxySet=true
#proxyPort=8080
#proxyHost=proxyout.lanl.gov
#JAVA_OPTS="$JAVA_OPTS -DproxySet=$proxySet -DproxyPort=$proxyPort -DproxyHost=$proxyHost"
