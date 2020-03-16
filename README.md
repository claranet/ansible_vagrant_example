# Ansible Vagrant example

This is a very simple project providing an example of how to test Ansible playbooks with dynamic virtual machines assuming the controller and managed hosts roles.

More information:
* [Vagrant](https://www.vagrantup.com/docs/index.html) - Vagrant Documentation
* [Ansible](https://docs.ansible.com/) - Ansible Documentation

### Prerequisites

What things you need to install the software and how to install them

```
Vagrant
```

## Running the tests

Edit the `config.yml` file with the necessary information and run the following command in the project root dir:

```
vagrant up
```

which searches for the `Vagrantfile` to start all the defined virual machines, and if configured to do so, executes the provided ansible playbook as the vagrant "provisioner". Take a look at: https://www.vagrantup.com/docs/provisioning/
