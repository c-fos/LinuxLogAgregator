#!/bin/bash - 
#===============================================================================
#
#          FILE: logAgregator.sh
# 
#         USAGE: ./logAgregator.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
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

. ./settings.sh                                 # settings loading
. ./clean.sh                                    # remove old logs and archives (all content of lastLog dir removed)
. ./hourly.sh > $LOGGERLOG                      # create log files in lastLog dir
. ./archiver.sh >> $LOGGERLOG                   # create an archive
. ./sender.sh                                   # send the archive by email (ssmtp and mutt used)
echo "all tasks done"

