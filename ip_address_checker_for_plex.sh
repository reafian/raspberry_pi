#!/bin/bash

plex_ip=/var/run/plex_ip

message_body="To update Plex Media Server do the following:

Press Home and select Apps from the menu.

Select Plex from the list of applications.

Select Settings at the bottom of the page.

Go to Manual Servers and press the right button to edit the connection addresses

Change the Connect IP address to this one: "

message_end="Any problems, give me a call."

# Set IP if we don't have one already
if [ ! -f /var/run/plex_ip ]
then
  curl ipecho.net/plain 2>/dev/null > $plex_ip
fi

new_ip=$(curl ipecho.net/plain 2>/dev/null)

old_ip=$(cat $plex_ip)

if [[ $new_ip != $old_ip ]]
then
  if [[ $new_ip != "" ]]
  then
    echo $new_ip > $plex_ip

    message=$(echo $message_body; echo $new_ip; echo $message_end)
    echo $message | mailx -s "Plex IP Address Change" -r "$(grep ^reply_to plex_users.ini | cut -d= -f2)" -c $(grep ^copy_to plex_users.ini | cut -d= -f2) $(grep ^mail_to plex_users.cfg | cut -d= -f2)
#    echo $message | mailx -s "Plex IP Address Change" -r "$(grep ^reply_to plex_users.ini | cut -d= -f2)" -c $(grep ^copy_to plex_users.ini | cut -d= -f2) $(grep ^mail_to plex_users.cfg | cut -d= -f2)
  fi
fi
