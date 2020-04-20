#!/bin/bash

echo "Install Redis in Docker. Press any key to continue [Ctrl + C to quit]"
read

read -p "Enter Redis Password [Default is 123456]: " password
if [ -z "${password}" ];then
	password=123456
fi

# create conf and data
mkdir -p /root/.redis/conf
mkdir -p /root/.redis/data
touch /root/.redis/conf/redis.conf

# make conf and save it to redis.conf
echo """
# 守护
daemonize no

# bind Adress
#bind 0.0.0.0

# protect
protected-mode no

# Password/AuthCode
requirepass $password

""" > /root/.redis/conf/redis.conf

# Run
docker run --name redis -it -d --privileged=true -p 6379:6379 -v /root/.redis/conf/redis.conf:/etc/redis/redis.conf -v /root/.redis/data:/data redis redis-server /etc/redis/redis.conf --appendonly yes

echo "Redis is running now. Please open port 6379 in your iptables."
echo "Your redis password is: $password"
echo "🎉 All of done."
