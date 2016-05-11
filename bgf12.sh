#!/usr/bin/expect -f

set timeout 30

set user rb
set passwd rb
set bgf12 bgf12


spawn telnet bgf12
expect "*login:*"
send "$user\r"
expect "*Password:*"
send "$passwd\r"
expect "*BGF12*"

log_file BGF_show_

send "show configuration\r"

while (1) {
  sleep 1
  expect {
    "*more*" {send " "}
    "*BGF12#*" {break}
  }
}

log_user 0

send "exit\r"

exit


