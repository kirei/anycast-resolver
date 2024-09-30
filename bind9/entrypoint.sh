#!/bin/sh

if [ ! -f /etc/rndc.key ]; then
    rndc-confgen -a -u named
fi

if [ -f /etc/named/startup-hook.sh ]; then
    . /etc/named/startup-hook.sh
fi

/usr/sbin/named -u named -f
