#!/usr/bin/env bash

##Vagrant Machine For Running Abba
echo "---------------------"
echo "setting up ubuntu"
apt-get update
apt-get -y install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev libv8-dev nodejs
chmod -R 777 /vagrant

##setting up Ruby 1.9.3-rc1 to use with Abba. We
##are using rbenv to do this
echo "---------------------"
echo "setting up rbenv, and ruby 1.9.3-rc1"
echo "---------------------"
apt-get -y install rbenv ruby-build ruby-dev
rbenv install 1.9.3-rc1
rbenv global 1.9.3-rc1
echo "gem: --no-document" > ~/.gemrc
gem install bundler

##Setting up MongoDB on the VM
echo "---------------------"
echo "setting up mongodb"
echo "---------------------"
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
apt-get update
apt-get install -y mongodb-org
mkdir -p /data/db

##We will be using rubyracer for server side javascript stuff. It's
##not included in the gemfile that comes with abba. Probably because abba
##is old. We then install all the other gems required for abba to start up
##using bundler
echo "---------------------"
echo "setting up rubyracer, fetching abba, and installing the required gems using bundler"
echo "---------------------"
gem install therubyracer
cd /vagrant
git clone git://github.com/maccman/abba.git && cd abba && bundle install
##That's it!
echo "---------------------"
echo "Machin Now Setup"
echo "---------------------"
