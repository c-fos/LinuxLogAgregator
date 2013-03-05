#!/bin/bash - 
#===============================================================================
#
#          FILE: archiver.sh
# 
#         USAGE: ./archiver.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 05.03.2013 15:07:21 NOVT
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

rm ${LOGDIR}/*.bz2
exec `tar -cjf ${LOGDIR}/${SHORT_DATE}.tar.bz2 ${LOGDIR}/*.log`
echo "archivation done"
