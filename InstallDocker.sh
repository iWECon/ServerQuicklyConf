value=$(uname -r)
echo "Your system version: " + $value
echo "Please confirm your version is equal or greater then to 3.10"
echo "-----------------------------"
echo "Press any key to continue. [Ctrl + c to quit]"
read

# install
yum -y install docker

# start docker service
service docker start

# runself when reboot
systemctl enable docker


docker-compose --version
echo "🎉 All of done."
