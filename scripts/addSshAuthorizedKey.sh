#!/bin/bash

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
