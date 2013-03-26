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

#check of .sh file existance
BASE_FILE_LIST=(./archiver.sh ./logAgregator.sh ./settings.sh ./clean.sh ./sender.sh)
OPTIONAL_FILE_LIST=( "./daily.sh" "./monthly.sh" "./hourly.sh")
BASE_DIR_LIST=(./lastLogs)

for path in ${BASE_FILE_LIST[@]}
do
	[ -f "$path" ] && \
      	echo "$path is the path of a real file" || \
        echo "No such file: $path"
done

for path in ${BASE_DIR_LIST[@]}
do
	[ -d "$path" ] && \
      	echo "$path is the path of a real folder" || \
        echo "No such folder: $path"
done

for path in ${OPTIONAL_FILE_LIST[@]}
do
	[ -f "$path" ] && \
      	echo "$path is the path of a real file" || \
        echo "No such file: $path"
done
