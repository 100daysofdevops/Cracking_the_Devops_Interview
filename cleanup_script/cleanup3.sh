#!/bin/bash
# Author: Prashant Lakhera
# Date: 04:07:2020
# Purpose: A Script to Cleanup Log Files V3, Enhanced Version


LOG_DIR=/home/prashant/Documents/bash_script
ROOT_UID=0
NON_ROOT_UID=87
LINES=50
C_CHDIR=86

# Run this script as a root user
if [ "$UID" -ne "$ROOT_UID" ]
then
	echo "You must me root user to execute this script"
	exit $NON_ROOT_UID
fi

# Testing if command line argument is present
# the length of STRING is nonzero
if [ -n "$1" ]
then
	lines=$1
else
	lines=$LINES
fi



# Checking the log directory before messing up the Log directory
cd $LOG_DIR

if [ `pwd` != "$LOG_DIR" ]
then
	echo "Can't change the $LOG_DIR"
	exit $C_CHDIR

fi

tail -n $lines syslog > syslog.temp
mv syslog.temp syslog
echo "Log files cleaned up" 
exit 0






