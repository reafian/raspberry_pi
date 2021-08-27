#!/bin/bash +x

# Generate a list of files to work with
today=$(date +"%Y%m%d")

ftp -inv wdmycloudmirror.local << EOF
user raspi raspberry
cd /Public/Shared\ Videos/Raspberry\ Pi
ls -l test.txt
quit
EOF

if ! grep $today test.txt
then
  echo "Today's directory does not exist. Creating..."
  ftp -inv wdmycloudmirror.local << EOF
  user raspi raspberry
  cd /Public/Shared\ Videos/Raspberry\ Pi
  mkdir $today
  quit
EOF
fi


/bin/ls /var/lib/motion | while read list
do
  ftp -in wdmycloudmirror.local << EOF
    user raspi raspberry
    lcd /var/lib/motion
    cd /Public/Shared\ Videos/Raspberry\ Pi
    cd $today
    put $list
    quit
EOF
  rm /var/lib/motion/$list
done

rm test.txt
