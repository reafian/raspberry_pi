**pi-hole Stuff**

This is just a dumping ground for anything Raspberry Pi related that I do.

*It's usually crap but if it works, it works :-)*

---

## Contents

This is the stuff that's in this repo.

1. IPV6_check.sh - IPV6 updater. A small script to automatically update the IPV6 value in setupVars.conf on my PiHole
2. move_camera_files.sh - The script that moves the motion video over to a WD MyCloud Mirror device. It would work except for the fact that the WD Mirror always overwites the SSH keys.
3. move_motion.conf - A basic motion file to record video and do something with it.
4. sounds.py - Stupid python script to play sounds on movement.
5. sounds_motion.conf - Motion configation to fire sounds.py on movement.
5. piboot.sh - A small script to reboot the pihole in then event that lookups start failing.
6. ip_address_checker_for_plex.sh - A small script to check the current public IP and send mail.

## IPV6_check.sh

The point of this was to keep the IPv6 addresses current because my BT "Smart" Hub would change the IPv6 address underneath the pihole and then the pihole would stop working. I've since changed to a UniFi UDM and it's been /so/ much better. If you've got a BT Hub it might be useful.

## move_camera_files.sh

I had a small Raspberry Pi with a camera attached that recorded video on movement. Problem was I didn't want to keep the video on the SD card permanently so it needed to be archived off somewhere. That somewhere was my WD My Home Mirror NAS which is fine apart from the fact that it removes the SSH keys every time it restarts. It's super annoying. Script was changed to support FTP instead (yeah, I know, FTP. Without keys though, whaddaya gonna do?) It worked pretty well until I needed the plug socket for something more important.

## motion.conf

motion file that recorded video on movement and fired off the move_camera_files script on completion.

## sounds.py

Small python script to play a random sound on movement. Provided good service at my wife's school as part of a display. Everytime one of the children walked passed a random Dr. Who sound would play. "Exterminate!" was very popular.

## sounds_motion.conf

Just the motion.conf file to trigger sounds.py

## piboot.sh

Sometimes the pihole just stops working. It's probably the least reliable piece of core infrastructure in that it seems to fail every now and then and, for some reason, it's always the last thing I look at (too many bad experiences with crappy routers). This script will do a lookup on a good, configureable, website and if the lookup fails three times in a row the pihole gets rebooted. Brutal but fair.

## ip_address_checker_for_plex.sh

This script checks the current external IP and compares it to the one from the previous run. If the address has changed then it just sends a mail out to the remote plex users to let them know of the change. In this case there are also instructions on how to make the change on this particular TV. The mail really could use some formatting...

---