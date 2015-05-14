#!/usr/bin/expect -f

set timeout 30

set wluser test167
set wlpasswd emvmsm1
set wslint16 wl88191

set nw_file_path /home/test167/elingyu/backup
set nw_file_name wl88191_network_config_

#set ser_file_path /usr/local/etc/ser

set dns_file_path /var/named


spawn ssh $wluser@$wslint16
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


spawn scp $wluser@$wslint16:$nw_file_path/$nw_file_name /home/elingyu/SBG/backup/STP18/wslint16/network/.
expect "Password: "
send "$wlpasswd\r"
expect "*>*"


#spawn scp $wluser@$wslint16:$ser_file_path/* /home/elingyu/SBG/backup/STP18/wslint16/SER2/SER2/.
#expect "Password: "
#send "$wlpasswd\r"
#expect "*>*"


spawn scp $wluser@$wslint16:$dns_file_path/* /home/elingyu/SBG/backup/STP18/wslint16/DNS2/DNS2/.
expect "Password: "
send "$wlpasswd\r"
expect "*>*"


exit



















