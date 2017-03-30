#!/usr/bin/env bash

#Thanks to Dwayne. | Link: https://gist.github.com/dwayne/87f807f0d313b444bb37
set -e
echo 'Running Python Provisions'
sudo apt-get -qq install libpq-dev python3-dev
sudo apt-get -qq install libpq-dev libreadline-dev libsqlite3-dev libssl-dev
cd /tmp
wget -O- -q https://www.python.org/ftp/python/3.6.1/Python-3.6.1.tgz | tar xz
cd Python-3.6.1
./configure
make -s
make -s altinstall
sudo -H pip3.6 install --upgrade pip
sudo -H pip3.6 -qq install python3-virtualenv
sudo -H pip3.6 install virtualenvwrapper
virtualenv vagrant/dev/virtualenv/ml

echo 'Clean up...'
cd && rm -rf /tmp/Python-3.6.1
