#!/usr/bin/expect -f

set timeout 30

set user test167
set passwd emvmsm1
set sbg-xt018 sbg-xt018


spawn telnet sbg-xt018
expect "*login:*"
send "$user\r"
expect "*password:*"
send "$passwd\r"
expect "*#*"

log_file sbg-xt018_show_

send "show configuration\r"

while (1) {
  sleep 1
  expect {
    "Press <SPACE> to continue or <Q> to quit:" {send " "}
    "*SBG-XT018.2 #*" {break}
  }
}

log_user 0

send "exit\r"

exit


