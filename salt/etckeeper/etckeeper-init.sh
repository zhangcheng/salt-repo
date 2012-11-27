#!/usr/bin/env bash

cd /etc
if [ -d .git ]; then
	echo "etckeeper already inited"
else
	etckeeper init
	git config --global user.name "Ruoogle Ops"
	git config --global user.email "ops@mamabang.com"
	etckeeper commit -m "initial commit"
	echo "etckeeper inited"
fi
