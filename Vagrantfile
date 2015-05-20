Vagrant.configure("2") do |config|
  config.vm.box = "puppetlabs/centos-6.6-64-puppet"

  config.vm.provision :puppet do |puppet|
    puppet.manifest_file = "site.pp"
    puppet.module_path = "modules"
    #puppet.options = "--verbose --debug"
  end

# Buildserver hosts Kibana and Elastic search
  config.vm.define :buildserver do |buildserver_config|
    buildserver_config.vm.network "private_network", ip: "192.168.52.4", netmask: "255.255.255.192"
    buildserver_config.vm.network :forwarded_port, guest: 22, host: 2422, id: "ssh", disabled: true
    buildserver_config.vm.network :forwarded_port, guest: 22, host: 2522, auto_correct: true
    buildserver_config.vm.hostname="buildserver"
    buildserver_config.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end
  end

  config.vm.define :production do |production_config|
    production_config.vm.hostname="production"
    production_config.vm.network "private_network", ip: "192.168.52.5", netmask: "255.255.255.192"
  end
end
