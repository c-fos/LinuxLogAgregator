#!/bin/bash - 

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

set -o nounset                              # Treat unset variables as an error

rm ${LOGDIR}/*.bz2
exec `tar -cjf ${LOGDIR}/${SHORT_DATE}.tar.bz2 ${LOGDIR}/*.log`
echo "archivation done"
