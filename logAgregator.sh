#!/bin/bash - 
#===============================================================================
#
#          FILE: logAgregator.sh
# 
#         USAGE: ./logAgregator.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: hourly OR daily OR monthly
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Ilya Malakhin (pilat1988@gmail.com), 
#  ORGANIZATION: 
#       CREATED: 05.03.2013 17:33:31 NOVT
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
#----------
#main
#---------

if [ -z "$1" ] ; then
        echo "There is must be one argument"
else
	. ./settings.sh                                 # settings loading
	if [ $1 = "hourly" ] ; then
		. ./hourly.sh >> $LOGGERLOG                      # create hourly log files in lastLog dir

	elif [ $1 = "daily" ] ; then
		. ./daily.sh >> $LOGGERLOG                      # create daily log files in lastLog dir
		. ./archiver.sh >> $LOGGERLOG                   # create an archive
		. ./sender.sh                                   # send the archive by email (ssmtp and mutt used)
		echo "reports sended"
		. ./clean.sh                                    # remove old logs and archives (all content of lastLog dir removed)
	
	elif  [ $1 = "monthly" ]; then
		. ./monthly.sh >> $LOGGERLOG

	else
		echo "unrecognized options"
	fi
fi

