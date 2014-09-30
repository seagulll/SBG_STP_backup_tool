#!/usr/bin/expect -f

set timeout 30

set wluser test167
set wlpasswd emvmsm1
set wslint15 wl88190

set nw_file_path /home/test167/elingyu/backup
set nw_file_name wl88190_network_config_

set ser_file_path /usr/local/etc/ser

set dns_file_path /var/named


spawn ssh $wluser@$wslint15
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


spawn scp $wluser@$wslint15:$nw_file_path/$nw_file_name /home/elingyu/SBG/backup/STP18/wslint15/network/.
expect "Password: "
send "$wlpasswd\r"
expect "*>*"


spawn scp $wluser@$wslint15:$ser_file_path/* /home/elingyu/SBG/backup/STP18/wslint15/SER1/SER1/.
expect "Password: "
send "$wlpasswd\r"
expect "*>*"


spawn scp $wluser@$wslint15:$dns_file_path/* /home/elingyu/SBG/backup/STP18/wslint15/DNS1/DNS1/.
expect "Password: "
send "$wlpasswd\r"
expect "*>*"


exit



















