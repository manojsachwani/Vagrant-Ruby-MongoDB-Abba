# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  #setting up and using Ubuntu trustu64 or 14.04LTS
  config.vm.box = "ubuntu/trusty64"
  #port forwarding. 3000 forwards from the guest to 3000 at the host. Default
  #for thin clients.
  config.vm.network "forwarded_port", guest: 3000, host: 3000, auto_correct: true
  #using shell scripts for provisioning.
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.provision :shell, path: "restart.sh", run: "always"
end
