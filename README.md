**pi-hole Stuff**

This is just a dumping ground for anything Raspberry Pi related that I do.

*It's usually crap but if it works, it works :-)*

---

## Contents

This is the stuff that's in this repo.

1. IPV6_check.sh - IPV6 updater. A small script to automatically update the IPV6 value in setupVars.conf on my PiHole
2. move_camera_files.sh - The script that moves the motion video over to a WD MyCloud Mirror device. It would work except for the fact that the WD Mirror always overwites the SSH keys.
3. motion.conf - A basic motion file to record video and do something with it.

## IPV6_check.sh

The point of this was to keep the IPv6 addresses current because my BT "Smart" Hub would change the IPv6 address underneath the pihole and then the pihole would stop working. I've since changed to a UniFi UDM and it's been /so/ much better. If you've got a BT Hub it might be useful.

## move_camera_files.sh

I had a small Raspberry Pi with a camera attached that recorded video on movement. Problem was I didn't want to keep the video on the SD card permanently so it needed to be archived off somewhere. That somewhere was my WD My Home Mirror NAS which is fine apart from the fact that it removes the SSH keys every time it restarts. It's super annoying. Script was changed to support FTP instead (yeah, I know, FTP. Without keys though, whaddaya gonna do?) It worked pretty well until I needed the plug socket for something more important.

## motion.conf

motion file that recorded video on movement and fired off the move_camera_files script on completion.
---