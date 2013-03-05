#!/bin/bash

FILENAME="$LOGDIR/`date +%x`.log"

DATE="date +%x_%X"
UNAME="uname -n -r -s"
SPACE="df -h"
DMESG="dmesg"

echo "Daily log for:" > $FILENAME
exec `$DATE >> $FILENAME`
exec `$UNAME >> $FILENAME`
echo "Space left:" >> $FILENAME
exec `$SPACE >> $FILENAME`
exec `$DMESG > $LOGDIR/dmesg.log`
#exec `cp /var/log/SOMELOG ${LOGDIR}/` #you could copy all logs you need to $LOGDIR
echo "Daily logs aggregation done"
