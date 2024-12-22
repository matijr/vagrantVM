# -*- mode: ruby -*-
# vi: set ft=ruby :
SCRIPT_PATH= "E:\\projects\\vagrantVM\\scripts"

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
# The most common configuration options are documented and commented below.
# For a complete reference, please see the online documentation at
# https://docs.vagrantup.com.

Vagrant.configure("2") do |config|

  config.vm.box = "bento/centos-stream-9"

    config.vm.provision "APPS",
    type: "shell",
    path: "#{SCRIPT_PATH}\\common-apps.sh"

    # You can disable this if you don't need DevOps tools
    config.vm.provision "DEVOPS", after: "APPS", 
    type: "shell",
    path: "#{SCRIPT_PATH}\\devops-tools.sh"

  config.vm.network "forwarded_port", guest: 80, host: 8080

  # config.vm.synced_folder "./data", "/vagrant_data/shared", type: "smb",

  # Allow or disable the synced folder
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # Configure the VM provider, such as VirtualBox, VMware or Hyper-V
  config.vm.provider "hyperv" do |hv|
  
    # Enable this option if you use VirtualBox and you need the GUI
    # Display the VirtualBox GUI when booting the machine
    # vb.gui = true

  # Customize the amount of memory on the VM:
    hv.memory = "2048"
    hv.maxmemory = "2048"
  end

  # Shows the IP address of the host to connect through RDP
  config.vm.provision "shell", inline: <<-SHELL
    echo "To access the GUI of the box use this IP:"
    hostname -I | awk '{print $1}'
  SHELL
end
