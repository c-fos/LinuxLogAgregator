#!/bin/bash - 
#===============================================================================
#
#          FILE: sender.sh
# 
#         USAGE: ./sender.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 05.03.2013 15:21:46 NOVT
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
#for correct work ssmtp and mutt should be configured
#
exec `cat $LOGGERLOG|mutt -a lastLogs/*.tar.bz2 -s "$IDENTIFICATOR" -- $EMAIL`


