#!/bin/bash

. ../etc/database.env

/opt/fedora/client/bin/fedora-find.sh localhost 8080 fedoraAdmin Fed0r@@dmin "pid" "$1:*" http | grep pid | awk '{print $2}'
