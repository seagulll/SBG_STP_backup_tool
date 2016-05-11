#!/usr/bin/expect -f

set timeout 30

set user ttcn3
set passwd ttcn3ttcn3
set titansim121 titansim121


spawn scp $user@$titansim121:/etc/network/interfaces /home/elingyu/SBG/backup/STP18/titansim121/network/.
expect "password: "
send "$passwd\r"
expect "*>*"


spawn scp $user@$titansim121:/home/ttcn3/titansim/cfg/IMS/* /home/elingyu/SBG/backup/STP18/titansim121/scripts/scripts/.
expect "password: "
send "$passwd\r"
expect "*>*"



exit



















