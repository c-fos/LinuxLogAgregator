#!/bin/bash

FILENAME="$LOGDIR/hourly.log"

DATE="date"
UNAME="uname -a"
UPTIME="uptime"
MEMORY="free -mt"
MEMORY2="vmstat"
PROCESSES="pstree -a"
USERS="w"
SPACE="df -h"
TEMP1="cat /sys/class/thermal/thermal_zone0/temp"
NETSTAT="netstat -t"
DMESG="dmesg"

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
echo "Space left" >> $FILENAME
exec `$SPACE >> $FILENAME`
echo "Temperarure" >> $FILENAME
exec `$TEMP1 >> $FILENAME`
echo "Netstat" >> $FILENAME
exec `$NETSTAT >> $FILENAME`
exec `$DMESG > $LOGDIR/dmesg.log`
echo "logs aggregation done"
