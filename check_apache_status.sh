#!/bin/bash

SERVICENAME="apache2"
# One liner
# which apache2 && systemctl status apache2 | systemctl start apache2

# Other way to check if the service is up
# ps aux |grep -i apache2 > /dev/null

netstat -antulp|grep :::80 > /dev/null
APACHESTATUS=$?
COUNT=0
THRESHOLD=2
if [[ $APACHESTATUS != 0 ]]
then
	echo "$SERVICENAME is not running"
	while [[ $COUNT -lt $THRESHOLD ]]
	do
		systemctl start $SERVICENAME

		if [ $? != 0 ]
		then
			(( COUNT++))
		else
			exit 0
		fi
	done		
 echo "There is some issue with $SERVICENAME" |mail -s "$SERVICENAME failure" root

else
	echo "$SERVICENAME is running"
fi
