#!/bin/sh

if [ ! -f /etc/rndc.key ]; then
    rndc-confgen -a
fi

/usr/sbin/named -u named -f
