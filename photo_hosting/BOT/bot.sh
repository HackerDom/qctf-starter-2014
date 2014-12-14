a=`(mongo < id.js) | grep -oe ": \".*\""`
b=${a:3:32}

if [ ! "$b" == "" ];then
   elinks http://127.0.0.1:1337/$b
fi