# -*- mode: ruby -*-
# vi: set ft=ruby :
#require 'vagrant-windows' 

Vagrant.configure("2") do |config|


  config.vm.define :master do |master|
    master.vm.box = "puppet"
    master.vm.hostname = "puppet.mypartssource.com"
    master.vm.provision :shell, :path => "bootstrap.sh"
    master.vm.synced_folder "modules/", "/etc/puppet/modules"
    master.vm.synced_folder "manifests/", "/etc/puppet/manifests"
    master.vm.synced_folder "hiera/", "/etc/puppet/hiera"
    master.vm.network :private_network, ip: "192.168.50.5"
#    master.vm.network :public_network
  end

  config.vm.define :agent1 do |agent1|
    agent1.vm.box = "2008R2STD"
    agent1.vm.hostname = "agent1.mypartssource.com"
    agent1.vm.guest = :windows
    agent1.windows.halt_timeout = 15
    agent1.winrm.username = "vagrant"
    agent1.winrm.password = "vagrant"
    agent1.vm.network :forwarded_port, guest: 5985, host: 5985
    agent1.vm.network :forwarded_port, guest: 3389, host: 3389
    agent1.vm.network :private_network, ip: "192.168.50.4"
    agent1.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
    end
    agent1.vm.provision :shell, :path => "win_setup.ps1"
end

end
