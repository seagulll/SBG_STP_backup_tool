#!/usr/bin/expect -f

set timeout 30

set user rb
set passwd rb
set bgf07 bgf07


spawn telnet bgf07
expect "*login:*"
send "$user\r"
expect "*Password:*"
send "$passwd\r"
expect "*BGF07*"

log_file BGF_show_

send "show configuration\r"

while (1) {
  sleep 1
  expect {
    "*more*" {send " "}
    "*BGF07#*" {break}
  }
}

log_user 0

send "exit\r"

exit


