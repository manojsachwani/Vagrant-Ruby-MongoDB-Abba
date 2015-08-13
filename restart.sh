#Auto start Abba on Vagrant up.
service mongod restart
cd /vagrant/abba
thin start
