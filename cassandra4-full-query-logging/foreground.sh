#!/bin/bash
while [ ! -f /usr/local/bin/wait.sh ] || [ $(stat -c "%a" /usr/local/bin/wait.sh) != "755" ]; do clear; sleep 0.2; done
clear
wait.sh
