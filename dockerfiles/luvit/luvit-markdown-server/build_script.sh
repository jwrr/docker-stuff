# Dockerfile for luvit server

sudo apt-get -y clean
sudo apt-get -y update
sudo apt-get -y install build-essential libreadline-dev libcmark-dev lua5.1 curl wget unzip

sudo curl -L https://github.com/luvit/lit/raw/master/get-lit.sh | sh
sudo mv lit luvi luvit /usr/local/bin

cd /var/local
sudo wget http://www.lua.org/ftp/lua-5.1.5.tar.gz
sudo tar zxvf lua-5.1.5.tar.gz
cd /var/local/lua-5.1.5
sudo make linux test
sudo make install

cd /var/local
sudo wget https://luarocks.org/releases/luarocks-3.8.0.tar.gz
sudo tar zxvf luarocks-3.8.0.tar.gz
cd /var/local/luarocks-3.8.0
sudo ./configure --with-lua-include=/usr/local/include
sudo make
sudo make install

sudo luarocks install lpeg
sudo luarocks install cmark
sudo apt-get -y install libyaml-dev
sudo luarocks install lua-yaml
sudo luarocks install lcmark
sudo luarocks install luafilesystem
#export PATH=$PATH:/lua_modules/bin
#CMD ["/var/local/luvit/server.lua"]

