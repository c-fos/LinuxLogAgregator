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


FILENAME="$LOGDIR/`date +%d_%m_%y`.log"
FILTER="`date '+%b %e'`"
DATE="date +%x_%X"
UNAME="uname -n -r -s"
SPACE="df -h"
DMESG="dmesg"
LOG_FILES_TO_CAT=( "/var/log/apcupsd.events" "/var/log/debug" "/var/log/syslog" )

echo "Daily log for:" > $FILENAME
exec `$DATE >> $FILENAME`
exec `$UNAME >> $FILENAME`
echo "Space left:" >> $FILENAME
exec `$SPACE >> $FILENAME`
exec `$DMESG > $LOGDIR/dmesg.log`

for logfile in ${LOG_FILES_TO_CAT[@]}
do
	[ -f "$logfile" ] && \
      	echo "Last 1000 records in $logfile" >> $FILENAME &&
        exec `grep "$FILTER" $logfile|tail -n 1000 >> $FILENAME` || \  # 
        echo "Daily. No such file: $logfile"
done
#exec `cp /var/log/SOMELOG ${LOGDIR}/` #you could copy all logs you need to $LOGDIR
echo "Daily logs aggregation done"
