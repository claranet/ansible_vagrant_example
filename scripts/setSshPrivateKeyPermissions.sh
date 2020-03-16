#!/bin/bash

show_usage() {
	echo -e "Usage: $0 USER"
}

if [ $# -lt 1 ]
then
	show_usage
	exit 1
fi

chmod -R 600 /home/$1/.ssh/id_rsa
echo 'Host server*.outscope.com' >> /home/$1/.ssh/config
echo 'StrictHostKeyChecking no' >> /home/$1/.ssh/config
echo 'UserKnownHostsFile /dev/null' >> /home/$1/.ssh/config
chmod -R 600 /home/$1/.ssh/config
chown $1:$1 /home/$1/.ssh/config
