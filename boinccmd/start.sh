#!/bin/bash
cd /data/boinc
boinc &
cd /data/server
node index.js&
cd /data/client/dist
serve -l 8081&
top