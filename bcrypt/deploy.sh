#!/bin/bash

cp deploy/xinetd.conf /etc/xinetd.d/qctf-starter-2014-bcrypt
service xinetd restart

