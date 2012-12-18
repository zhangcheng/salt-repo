#!/bin/sh

/etc/update-motd.d/00-header

echo
echo "hostname : `hostname`"

echo
ifconfig | awk '/^[^ ]/{name=$1} $1 == "inet" {sub(/addr:/,"",$2);print name,"\t",$2}' | grep -v '127.0.0.1'

echo
echo -n "  System information as of "
/bin/date

echo
/usr/bin/landscape-sysinfo --exclude-sysinfo-plugins=LandscapeLink
echo
