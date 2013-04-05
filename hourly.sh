#!/bin/bash

# Copyright 2013 ilya malakhin
#  This file is part of LinuxLogAgregator.
#
#    LinuxLogAgregator is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    LinuxLogAgregator is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with LinuxLogAgregator.  If not, see <http://www.gnu.org/licenses/>.

FILENAME="$LOGDIR/`date +%d_%m_%y_%X`.log"

DATE="date +%x_%X"
UNAME="uname -n -r -s"
UPTIME="uptime"
MEMORY="free -m"
MEMORY2="vmstat"
PROCESSES="pstree -a"
USERS="w"
TEMP1="cat /sys/class/thermal/thermal_zone0/temp" # add cycle to monitor all sensors or use lm_sensors
NETSTAT="netstat"
LOG_FILES_TO_CAT=( "/var/log/daemon.log" "/var/log/mail.log" "/var/log/debug" "/var/log/dmesg" )

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
for logfile in ${LOG_FILES_TO_CAT[@]}
do
	[ -f "$logfile" ] && \
      	echo "Last 100 records in $logfile" >> $FILENAME &&
        exec `tail -n 100 $logfile >> $FILENAME` || \
        echo "Hourly. No such file: $logfile"
done

echo "Hourly log aggregation done. $DATE"
