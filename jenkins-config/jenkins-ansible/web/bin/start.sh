#!/bin/bash

# Starts ssh

/usr/sbin/sshd

# Starts php process in background

mkdir /run/php-fpm && /usr/sbin/php-fpm -c /etc/php/fpm


