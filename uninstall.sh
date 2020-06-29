#!/bin/bash
sudo echo -n ""

# hapus si alias, smoga bisa
cd
# uninstall="unalias passwd"
echo "unalias passwd" >> .bashrc

# konfigurasi standar ssmtp
rm /etc/ssmtp/ssmtp.conf
mv /etc/ssmtp/ori.txt /etc/ssmtp/ssmtp.conf

# hapus file-file
rm -r /opt/kelompokkucing/

# selamat tinggal
echo "******************"
echo "    good bye"
echo "******************"