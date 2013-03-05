#!/bin/bash

FILENAME="$LOGDIR/`date +%x_%X`.log"

DATE="date +%x_%X"
UNAME="uname -n -r -s"                          
UPTIME="uptime"
MEMORY="free -m"
MEMORY2="vmstat"
PROCESSES="pstree -a"
USERS="w"
TEMP1="cat /sys/class/thermal/thermal_zone0/temp" # add cycle to monitor all sensors or use lm_sensors
NETSTAT="netstat"

echo "Hourly log for:" > $FILENAME
exec `$DATE >> $FILENAME`
exec `$UNAME >> $FILENAME`
exec `$UPTIME >> $FILENAME`
echo "Memory usage" >> $FILENAME
exec `$MEMORY >> $FILENAME`
exec `$MEMORY2 >> $FILENAME`
echo "Processes running" >> $FILENAME
exec `$PROCESSES >> $FILENAME`
exec `$USERS >> $FILENAME`
echo "Temperarure" >> $FILENAME
exec `$TEMP1 >> $FILENAME`
echo "Netstat" >> $FILENAME
exec `$NETSTAT >> $FILENAME`
#exec `cp /var/log/SOMELOG ${LOGDIR}/` #you could copy all logs you need to $LOGDIR
echo "hourly log aggregation done"

