# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "puppet"
  config.vm.hostname = "puppet.mypartssource.com"
  config.vm.network :public_network
  config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.synced_folder "modules/", "/etc/puppet/modules"
  config.vm.synced_folder "manifests/", "/etc/puppet/manifests"
  config.vm.synced_folder "hiera/", "/etc/puppet/hiera"
end
