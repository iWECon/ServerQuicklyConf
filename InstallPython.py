read -p "输入Python版本号 [默认为 3.8.2]: " pyversion
if [ -z "${pyversion}" ];then
	pyversion="3.8.2"
fi

cd /root

# install depends
yum -y groupinstall "Development tools"

yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel libffi-devel

wget https://www.python.org/ftp/python/$pyversion/Python-$pyversion.tar.xz
tar -xvJf Python-$pyversion.tar.xz
cd Python-$pyversion

mkdir /usr/local/python3
./configure --prefix=/usr/local/python3
make && make install

ln -s /usr/local/python3/bin/python3 /usr/local/bin/python3
ln -s /usr/local/python3/bin/pip3 /usr/local/bin/pip3

python3 -V
pip3 -V

echo "🎉 All of done."
