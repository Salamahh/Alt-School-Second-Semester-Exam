Vagrant.configure("2") do |config|

  config.vm.define "Master" do |master|
    master.vm.box = "ubuntu/focal64"

    master.vm.hostname = "Master"
    master.vm.network "private_network", ip: "192.168.33.22"

    master.vm.provision :shell, path: "Sallybash.sh"
end
config.vm.define "Slave" do |slave|
    slave.vm.box = "ubuntu/focal64"
    slave.vm.hostname = "slave"
    slave.vm.network "private_network", ip: "192.168.33.21"
end
end
