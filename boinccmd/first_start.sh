#!/bin/bash

cd /data/boinc
boinc&
sleep 10

# Launch this script on container creation
read -p "World Community Grid username: " username
read -s -p "World Community Grid password: " password
echo
echo "Authenticating..."
auth_raw=$(boinccmd --lookup_account http://www.worldcommunitygrid.com/ "$username" "$password")
auth=${auth_raw: -32}

echo "Attaching World Community Grid project..."
boinccmd --project_attach http://www.worldcommunitygrid.com/ $auth

sleep 30
killall boinc

echo "Done!"