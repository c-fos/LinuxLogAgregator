#!/bin/bash

FILENAME="$LOGDIR/`date +%m.%Y`.log"

DATE="date +%x_%X"
UNAME="uname -a"
UPTIME="uptime"
SMART1="smartctl --all /dev/sda"
SMART2="smartctl --all /dev/sdb"                # if any
LOGSIZE="du /var/log/ -ah"

echo "Monthly log for:" > $FILENAME
exec `$DATE >> $FILENAME`
exec `$UNAME >> $FILENAME`
exec `$UPTIME >> $FILENAME`
echo "S.M.A.R.T. information" >> $FILENAME
exec `$SMART1 >> $FILENAME`
exec `$SMART2 >> $FILENAME`
echo "log size" >>  $FILENAME
exec `$LOGSIZE >> $FILENAME`
#exec `cp /var/log/SOMELOG ${LOGDIR}/` #you could copy all logs you need to $LOGDIR
echo "monthly log aggregation done"
