#! /bin/bash

setupvars=/etc/pihole/setupVars.conf

IPV6_ADDR=$(/sbin/ifconfig eth0 | /bin/grep inet6 | /bin/grep -v fe80:: | /usr/bin/awk '{print $2}')
VARS_IPV6=$(/bin/grep IPV6 $setupvars | /usr/bin/cut -d= -f2)

if [ -z $IPV6_ADDR ]
then
  echo "No IPV6 Address, will try again later."
  exit 1
fi

if [ -z $VARS_IPV6 ]
then
  echo "Unable to extract IPV6_ADDRESS from $setupvars, is there one there?"
  exit 1
fi

if [ $IPV6_ADDR == $VARS_IPV6 ]
then
  echo "No IPV6 changes detected, doing nothing."
  exit 0
fi

if [ $IPV6_ADDR != $VARS_IPV6 ]
then
  echo "IPV6 mismatch between $setupvars and ifconfig."
  echo "Updating $setupvars"
  /bin/sed -i.old "s/$VARS_IPV6/$IPV6_ADDR/" $setupvars
  /usr/local/bin/pihole -g
  exit 0
fi
