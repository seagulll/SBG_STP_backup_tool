#!/usr/bin/expect -f

set timeout 30

set wluser test167
set wlpasswd emvmsm1
set wl8819 wl8819

set nw_file_path /home/test167/elingyu/backup
set nw_file_name wl8819_network_config_

set xpres_file_path /home/test167/xPres


spawn ssh $wluser@$wl8819
expect "Password: "
send "$wlpasswd\r"
expect "*>*"

send "cd $nw_file_path\r"
expect "*>*"

send "rm -rf $nw_file_name\r"

send "ifconfig -a >> $nw_file_name\r"
expect "*>*"

send "route -n >> $nw_file_name\r"
expect "*>*"

send "route -A inet6 >> $nw_file_name\r"
expect "*>*"


spawn scp $wluser@$wl8819:$nw_file_path/$nw_file_name /home/elingyu/SBG/backup/STP18/wl8819/network/.
expect "Password: "
send "$wlpasswd\r"
expect "*>*"


spawn scp $wluser@$wl8819:$xpres_file_path/* /home/elingyu/SBG/backup/STP18/wl8819/xPres/xPres/.
expect "Password: "
send "$wlpasswd\r"
expect "*>*"



exit



















