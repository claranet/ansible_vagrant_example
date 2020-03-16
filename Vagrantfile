# Read config file
current_dir    = File.dirname(File.expand_path(__FILE__))
configs        = YAML.load_file("#{current_dir}/config.yml")
vagrant_config = configs['configs']

# Vagrant configuration zone, where all servers and controller must be defined
Vagrant.configure(2) do |config|

    # Create a folder in all guest machines with the content of the project
    config.vm.synced_folder ".", "/vagrant", mount_options: ['umask=022'] #without umask, ansible.cfg is ignored

    # Loop to create all managed hosts
    (1..vagrant_config['managed_node_count']).each do |i|
        config.vm.define "server#{i}" do |server|
            server.vm.box = vagrant_config['virtual_machine']['server_image_name']
            server.vm.hostname = vagrant_config['network']['server_base_name'] + "#{i}." + vagrant_config['network']['domain']
            server.vm.network "private_network", ip: vagrant_config['network']['server_subnet'] + ".#{i}0"

            # Expose HTTP ports to outside
            server.vm.network :forwarded_port, guest: vagrant_config['network']['http_guest_port'], 
                host: vagrant_config['network']['http_host_port_base'] + i

            # Authorize the controller's ssh private key 
            public_key = File.read("files/insecure_id_rsa.pub")
            server.vm.provision "shell", inline: <<-SHELL
                /vagrant/scripts/addSshAuthorizedKey.sh vagrant '#{public_key}'
            SHELL
        end
    end

    # Create the controller machine where the ansible playbook should be executed
    config.vm.define "controller" do |controller|
        controller.vm.box = vagrant_config['virtual_machine']['controller_image_name']
        controller.vm.hostname = vagrant_config['network']['controller_name']
        controller.vm.network "private_network", ip: vagrant_config['network']['controller_ip']
        controller.vm.provision "file", source: "files/insecure_id_rsa", destination: "/home/vagrant/.ssh/id_rsa"

        controller.vm.provision "shell", inline: <<-SHELL
            # Add server hostnames to /etc/hosts file
            /vagrant/scripts/addHosts.sh /vagrant/files/hosts

            # Add controller's private key
            /vagrant/scripts/setSshPrivateKeyPermissions.sh vagrant

            # Install ansible
            sudo yum install -y ansible
        SHELL

        # Define Ansible files
        controller.vm.provision "ansible_local" do |ansible|
            ansible.limit = "all"
            ansible.config_file = vagrant_config['ansible_src_path'] + '/ansible.cfg'
            ansible.inventory_path = vagrant_config['ansible_src_path'] + '/inventory'
            ansible.playbook = vagrant_config['ansible_src_path'] + '/playbook.yml'
        end
    end
end