#!/bin/bash

#搭建LNMP 脚本
#Author: ksl
#Mail: 842888432@qq.com
#Date: 2018/09/12


#构建Nginx的安装源仓库
cat << EOF >/etc/yum.repos.d/ngin.repo
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/7/\$basearch
gpgcheck=0
enabled=1
EOF
#生成Nginx.repo的仓库缓存
yum makecache fast 
#安装Nginx web server 服务
yum -y install nginx

#启动nginx
systemctl start nginx

#创建虚拟主机的配置文件
cat << EOF >/etc/nginx/conf.d/default.conf
server {
    listen       80;
    server_name  localhost;
    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }

    location ~ \.php$ {
        root           html;
        fastcgi_pass   127.0.0.1:9000;
        fastcgi_index  index.php;
        fastcgi_param  SCRIPT_FILENAME  /usr/share/nginx/html$fastcgi_script_name;
        include        fastcgi_params;
    }
}

EOF
#安装数据库
yum install mariadb-server mariadb -y
#启动mysql
systemctl start mariadb

#安装自动应答
yum install expect -y
#设置数据库密码
/usr/bin/expect <<!
spawn mysqladmin -uroot -p password "root"
expect "Enter password:"
send "\n"
!
#生成wordprss的数据库
mysql -uroot -proot -e "create database wordpress;"


#安装php的环境
yum -y install php php-mysql php-gd php-devel php-mbstring php-mcrypt php-xml php-fpm


#启动PHP
systemctl start php-fpm


#上线项目
yum install wget -y
wget https://cn.wordpress.org/wordpress-4.9.4-zh_CN.tar.gz -O /tmp/wordpress.tar.gz

tar xf /tmp/wordpress.tar.gz 
#复制到发布目录
cp -rf ./wordpress/* /usr/share/nginx/html/

mv /usr/share/nginx/html/wp-config-sample.php /usr/share/nginx/html/wp-config.php

#替换wp-config.php文件内容
sed -ri 's/database_name_here/wordpress/g' /usr/share/nginx/html/wp-config.php
sed -ri 's/username_here/root/g' /usr/share/nginx/html/wp-config.php
sed -ri 's/password_here/root/g' /usr/share/nginx/html/wp-config.php

#重新启动nginx php-fpm mariadb
systemctl restart nginx php-fpm mariadb


