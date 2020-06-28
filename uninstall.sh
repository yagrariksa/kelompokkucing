#!/bin/bash
sudo echo -n ""

# hapus si alias, smoga bisa
cd
uninstall="unalias passwd"
echo $uninstall >> .bashrc


# hapus file-file
rm -r /opt/kelompokkucing/

# selamat tinggal
echo "******************"
echo "    good bye"
echo "******************"