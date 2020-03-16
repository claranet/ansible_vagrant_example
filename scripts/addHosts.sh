#!/bin/bash
# Copyright 2020 OutScope Solutions. All rights reserved.
# Distributed under the MIT License found in the LICENSE file

show_usage() {
	echo -e "Usage: $0 NEW_HOSTS"
}

if [ $# -lt 1 ]
then
	show_usage
	exit 1
fi

while IFS="" read -r host || [ -n "$host" ]
do
  echo "$host" | tee -a /etc/hosts
done < $1