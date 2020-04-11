#!/bin/bash
# Author: Prashant Lakhera
# Date: 04:07:2020
# Purpose: A Script to Cleanup Log Files V2, Use of variable rather then using the hardcord value


LOG_DIR=/home/prashant/Documents/bash_script
cd $LOG_DIR
cp /dev/null syslog
echo "Log file cleaned"