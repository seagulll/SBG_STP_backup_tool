#!/usr/bin/expect -f

set timeout 30

set user rb
set passwd rb
set bgf02 bgf02


spawn telnet bgf02
expect "*login:*"
send "$user\r"
expect "*Password:*"
send "$passwd\r"
expect "*BGF02*"

log_file BGF_show_

send "show configuration\r"

while (1) {
  sleep 1
  expect {
    "*more*" {send " "}
    "*BGF02#*" {break}
  }
}

log_user 0

send "exit\r"

exit


