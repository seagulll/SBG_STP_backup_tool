#!/usr/bin/expect -f

set timeout 30

set user ttcn3
set passwd ttcn3ttcn3
set titansim120 titansim120


spawn scp $user@$titansim120:/etc/network/interfaces /home/elingyu/SBG/backup/STP18/titansim120/network/.
expect "password: "
send "$passwd\r"
expect "*>*"


spawn scp $user@$titansim120:/home/ttcn3/titansim/cfg/IMS/* /home/elingyu/SBG/backup/STP18/titansim120/scripts/scripts/.
expect "password: "
send "$passwd\r"
expect "*>*"



exit



















