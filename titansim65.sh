#!/usr/bin/expect -f

set timeout 30

set user ttcn3
set passwd ttcn3ttcn3
set titansim65 titansim65


spawn scp $user@$titansim65:/etc/network/interfaces /home/elingyu/SBG/backup/STP18/titansim65/network/.
expect "password: "
send "$passwd\r"
expect "*>*"


spawn scp $user@$titansim65:/home/ttcn3/titansim/cfg/IMS/* /home/elingyu/SBG/backup/STP18/titansim65/scripts/scripts/.
expect "password: "
send "$passwd\r"
expect "*>*"



exit



















