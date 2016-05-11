#!/usr/bin/expect -f

set timeout 30

set user ttcn3
set passwd ttcn3ttcn3
set titansim84 titansim84


spawn scp $user@$titansim84:/etc/network/interfaces /home/elingyu/SBG/backup/STP18/titansim84/network/.
expect "password: "
send "$passwd\r"
expect "*>*"


spawn scp $user@$titansim84:/home/ttcn3/titansim/cfg/IMS/* /home/elingyu/SBG/backup/STP18/titansim84/scripts/scripts/.
expect "password: "
send "$passwd\r"
expect "*>*"



exit



















