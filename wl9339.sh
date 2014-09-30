#!/usr/bin/expect -f

set timeout 30

set wluser test167
set wlpasswd emvmsm1
set wl9339 wl9339

set nw_file_path /home/test167/elingyu/backup
set nw_file_name wl9339_network_config_

set xpres_file_path /home/test167/xPres


spawn ssh $wluser@$wl9339
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


spawn scp $wluser@$wl9339:$nw_file_path/$nw_file_name /home/elingyu/SBG/backup/STP18/wl9339/network/.
expect "Password: "
send "$wlpasswd\r"
expect "*>*"


spawn scp $wluser@$wl9339:$xpres_file_path/* /home/elingyu/SBG/backup/STP18/wl9339/xPres/xPres/.
expect "Password: "
send "$wlpasswd\r"
expect "*>*"



exit



















