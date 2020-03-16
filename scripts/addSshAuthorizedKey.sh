#!/bin/bash
# Copyright 2020 OutScope Solutions. All rights reserved.
# Distributed under the MIT License found in the LICENSE file

show_usage() {
	echo -e "Usage: $0 USER SSH_KEY"
}

if [ $# -lt 2 ]
then
	show_usage
	exit 1
fi

echo 'Copying ansible-vm public SSH Keys to the VM'
echo $2 >> /home/$1/.ssh/authorized_keys
chmod -R 600 /home/$1/.ssh/authorized_keys
