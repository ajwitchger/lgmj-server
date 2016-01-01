Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_check_update = false
  
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 8443, host: 8443
  config.vm.network "forwarded_port", guest: 4848, host: 4848
  config.vm.network "forwarded_port", guest: 3306, host: 3306

  config.vm.network "private_network", ip: "192.168.56.150"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
	vb.gui 		= false
	vb.name 	= "LGMJ Server"
	vb.memory 	= "2048"
  end

  # Copy independent files to system
  config.vm.provision :file, source: "config/glassfish", destination: "glassfish"
  
  # Enable provisioning with a shell script.
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.provision :shell, path: "timezone.sh"
end
