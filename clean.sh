#!/bin/bash - 
#===============================================================================
#
#          FILE: clean.sh
# 
#         USAGE: ./clean.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 05.03.2013 18:20:30 NOVT
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
rm $LOGGERLOG
rm ${LOGDIR}/*
echo "cleaning done"

