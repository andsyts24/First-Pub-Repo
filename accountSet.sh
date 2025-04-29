#!/bin/bash
if [[ "$EUID" = 0 ]]; then
  echo "(1) You are root... Running rest of script..."
else
  echo "(2) You must be root to run this script..."
  exit
fi

password=$( shuf -n 1 /usr/share/dict/words )
echo "Setting up accounts..."
echo $USER:$password | chpasswd
rpassword=$( shuf -n 1 /usr/share/dict/words )
echo root:$rpassword | chpasswd
echo "Done with setup..."
sleep 4
echo "Rebooting System Now..."
reboot
