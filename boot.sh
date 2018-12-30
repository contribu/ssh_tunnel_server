#!/bin/bash

set -e

echo "$SSH_AUTHORIZED_KEY" > /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
erb /root/sshd_config.erb > /etc/ssh/sshd_config

/usr/sbin/sshd -D -E /dev/stdout
