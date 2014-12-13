#!/bin/bash

g++ -o blackbox -Wall -O2 blackbox.cpp

cp deploy/xinetd.conf /etc/xinetd.d/qctf-starter-2014-blackbox
service xinetd restart

