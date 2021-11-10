#! /bin/bash

lookup_server=www.bt.com
count_log=/tmp/pihole.counter

host $lookup_server >/dev/null 2>&1

echo $?

if [[ $? != 0 ]]
then
  if [[ -f $count_log ]]
  then
    current_value=$(cat $count_log)
    new_value=$(($current_value + 1))
    if [[ $new_value == 3 ]]
    then
      echo pi hole has failed. Rebooting
      logger -s "pi hole has failed. Rebooting"
      reboot --force --no-wall
    else
      echo $new_value > $count_log
    fi
  else
    echo 1 > $count_log
  fi
fi