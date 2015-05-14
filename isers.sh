#!/usr/bin/expect -f

set timeout 30

set sisuser root 
set sispasswd tre,14
set stpsis stp18sis01


spawn ssh $sisuser@$stpsis
expect "Password: "
send "$sispasswd\r"
expect "*sis1:~ #*"

send "ssh sysadmin@blade_0_21.lct\r"
while (1) {
  sleep 1
  expect {
    "*yes/no*" {send "yes\r"}
    "Password: " {send "sysadmin\r"}
    "boot_blade_0_21#" {break}
  }
}

send "copy configuration ISER1.conf\r"
expect "boot_blade_0_21#"
send "exit\r"
expect "*sis1:~ #*"


send "ssh sysadmin@blade_0_23.lct\r"
while (1) {
  sleep 1
  expect {
    "*yes/no*" {send "yes\r"}
    "Password: " {send "sysadmin\r"}
    "boot_blade_0_23#" {break}
  }
}

send "copy configuration ISER2.conf\r"
expect "boot_blade_0_23#"
send "exit\r"
expect "*sis1:~ #*"


spawn scp $sisuser@$stpsis:/private/bs_ISER_4/usr/local/temp/operator/ISER1.conf /home/elingyu/SBG/backup/STP18/ISERs/.
expect "Password: "
send "$sispasswd\r"
expect "*>*"

spawn scp $sisuser@$stpsis:/private/bs_ISER_5/usr/local/temp/operator/ISER2.conf /home/elingyu/SBG/backup/STP18/ISERs/.
expect "Password: "
send "$sispasswd\r"
expect "*>*"


exit








