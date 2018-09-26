#!/bin/bash
#for i in jim tom lucy lily;do
#if id $i &>/dev/null;then
#	echo "用户${i}的UID为$(id -u $i )"
#else
#        useradd $i && echo "用户${i}创建成功！"
#fi
#done

#改写练习1,先判断执行脚本的用户是不是root,如果是就执行练习1的操作；否则就提示不是root并退出。
#[ $USER != "root" ] && echo "非root权限" && exit 
#read -p "请输入要创建的用户名：" name
#if  id $name&>/dev/null ;then
#    echo "该用户已经存在"
#else
#  useradd $name
#fi


#3.写一个脚本,从标准输入读取一个IP地址,要求IP不能为空,如果为空,直接退出脚本；不为空那么就测试该主机是否存活,活着输出“alive”,否则输出“not alive” 
read -p "输入IP地址(如：192.168.0.1):" ip
[ "$ip"  ==  "" ] && echo "不用为空" && exit
if ping -c1  $ip &>/dev/null;then
   echo "alive"
else
   echo "not alive"
fi
