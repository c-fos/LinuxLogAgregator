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

FILENAME="$LOGDIR/`date +%m.%Y`.log"

DATE="date +%x_%X"
UNAME="uname -a"
UPTIME="uptime"
SMART1="smartctl --all /dev/sda"
SMART2="smartctl --all /dev/sdb"                # if any
LOGSIZE="du /var/log/ -ah"
FIREBIRDDBINFO="/opt/firebird/bin/gstat -l $DBNAME"  #unuseful for most of users
LOG_FILES_TO_CAT=( "/var/log/fsck/checkfs" "/var/log/fsck/checkroot" "/var/log/boot" )

echo "Monthly log for:" > $FILENAME
exec `$DATE >> $FILENAME`
exec `$UNAME >> $FILENAME`
exec `$UPTIME >> $FILENAME`
echo "S.M.A.R.T. information" >> $FILENAME
exec `$SMART1 >> $FILENAME`
exec `$SMART2 >> $FILENAME`
echo "log size" >>  $FILENAME
exec `$LOGSIZE >> $FILENAME`
echo "Firebird db info" >> $FILENAME
[ -f "/opt/firebird/bin/gstat" ] && exec `$FIREBIRDDBINFO >> $FILENAME` || \
echo "Monthly. No such file: /opt/firebird/bin/gstat"

for logfile in ${LOG_FILES_TO_CAT[@]}
do
	[ -f "$logfile" ] && \
      	echo "Last 1000 records in $logfile" >> $FILENAME &&
        exec `tail -n 1000 $logfile >> $FILENAME` || \
        echo "Monthly. No such file: $logfile"
done
#exec `cp /var/log/SOMELOG ${LOGDIR}/` #you could copy all logs you need to $LOGDIR
echo "monthly log aggregation done"
