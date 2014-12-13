```
cd photo_hosting
```

### 1. Установить и запустить MongoDB

http://docs.mongodb.org/manual/administration/install-on-linux/



### 2. Установить необходимые Perl-модули

```
sudo cpan install Mojolicious
sudo cpan install Mango
sudo cpan install Image::ExifTool
sudo cpan install Digest::MD5
sudo cpan install Data::Dumper
```

### 3. Запустить hypnotoad
```
hypnotoad ./script/photo_hosting
```

```
sudo netstat -tulpn | grep ":8080"
```


Если нужно поменять порт, то в файле ```./config.json``` отредактировать строку
```
"listen" : ["http://127.0.0.1:1337"]
```

### 4. Настроить nginx в качестве прокси сервера
```
upstream myapp {
  server 127.0.0.1:8080;
}

server {
  listen 192.168.37.136:1337;
  server_name localhost;
  location / {
    proxy_pass http://myapp;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
  }
}
```