#! /bin/bash

count_log=/var/run/pihole.counter

tail -5 /var/log/syslog | grep -c "failed to perform an HTTPS request"

if [[ $? == 0 ]]
then
  if [[ -f $count_log ]]
  then
    current_value=$(cat $count_log)
    new_value=$(($current_value + 1))
    if [[ $new_value -ge 3 ]]
    then
      echo $new_value > $count_log
      echo pi hole has failed. Rebooting
      logger -s "pi hole has failed. Rebooting"
      sudo reboot
    else
      echo $new_value > $count_log
    fi
  else
    echo 1 > $count_log
  fi
fi
