#!/bin/bash
LOCAL_VERSION=$(cat version 2> /dev/null)
curl -s http://35.189.104.46/Community_Servers -o /tmp/Community_Servers.html
REMOTE_VERSION=$(perl -ne '/Current\sVersion:\s(\d+)/ && print $1' /tmp/Community_Servers.html)
if [[ $REMOTE_VERSION -gt $LOCAL_VERSION ]]; then
	echo "Updating server to $REMOTE_VERSION. This will take a moment..."
	URL=$(perl -ne '/.*href="(.*\.zip)">Linux/ && print $1' /tmp/Community_Servers.html)
	curl -s $URL -o /tmp/linuxserver.zip
    unzip -o /tmp/linuxserver.zip
    rm /tmp/linuxserver.zip
    chmod +x /LinuxServer/Battalion/Binaries/Linux/BattalionServer
    echo $REMOTE_VERSION > version
fi
rm /tmp/Community_Servers.html
