#!/bin/bash
EXTERNAL_IP=$(curl -s http://checkip.amazonaws.com/)
echo "External IP: $EXTERNAL_IP"
./Battalion/Binaries/Linux/BattalionServer \
     /Game/Maps/Final_Maps/Derailed?Game=/Script/ShooterGame.BombGameMode?listen \
     -broadcastip="$EXTERNAL_IP" -PORT=7777 -QueryPort=7780 \
     -log \
     -defgameini="../../../DefaultGame.ini"
