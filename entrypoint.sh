#!/bin/bash
source update.sh
if [[ ! -a /config/DefaultGame.ini ]]; then
  echo "Copying default config file to volume"
  cp /LinuxServer/DefaultGame.ini /config/
fi
echo "Starting community server version $LOCAL_VERSION"
EXTERNAL_IP=$(curl -s http://checkip.amazonaws.com/)
echo "External IP: $EXTERNAL_IP"
/LinuxServer/Battalion/Binaries/Linux/BattalionServer \
     /Game/Maps/Final_Maps/Derailed?Game=/Script/ShooterGame.BombGameMode?listen \
     -broadcastip="$EXTERNAL_IP" -PORT=7777 -QueryPort=7780 \
     -log \
     -defgameini="/config/DefaultGame.ini"
