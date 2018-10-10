#!/bin/bash

domainname test.local

cat /etc/hosts
echo 'Checking for nis_server'
ping -c 4 nis_server

/usr/lib64/yp/ypinit -s nis_server

exec /usr/sbin/init
