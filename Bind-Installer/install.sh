#!/bin/bash

read -p "What would you like to do (bind/unbind/add)? "

[ "$REPLY" != "bind" ] || exec /Bind-Installer/src/bind.sh
[ "$REPLY" != "unbind" ] || exec /Bind-Installer/src/unbind.sh
[ "$REPLY" != "add" ] || exec /Bind-Installer/src/add.sh
 
