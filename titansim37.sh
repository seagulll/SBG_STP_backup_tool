#!/usr/bin/expect -f

set timeout 30

set user ttcn3
set passwd ttcn3ttcn3
set titansim37 titansim37


spawn scp $user@$titansim37:/etc/network/interfaces /home/elingyu/SBG/backup/STP18/titansim37/network/.
expect "password: "
send "$passwd\r"
expect "*>*"


spawn scp $user@$titansim37:/home/ttcn3/titansim/cfg/IMS/* /home/elingyu/SBG/backup/STP18/titansim37/scripts/scripts/.
expect "password: "
send "$passwd\r"
expect "*>*"



exit



















