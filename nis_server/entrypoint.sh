#!/bin/bash -e

useradd reg1
useradd reg2

domainname test.local
/usr/lib64/yp/ypinit -m

exec /usr/sbin/init
