# Ansible Vagrant example

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

This is a very simple project providing an example of how to test Ansible playbooks with dynamic virtual machines assuming the controller and managed hosts roles.

More information:
* [Vagrant](https://www.vagrantup.com/docs/index.html) - Vagrant Documentation
* [Ansible](https://docs.ansible.com/) - Ansible Documentation

### Prerequisites

What things you need to install the software and how to install them

```
Vagrant
```

Note that this project also works in a Windows machine

## Running the tests

Edit the `config.yml` file with the necessary information and run the following command in the project root dir:

```
vagrant up
```

which searches for the `Vagrantfile` to start all the defined virual machines, and if configured to do so, executes the provided ansible playbook as the vagrant "provisioner". Take a look at: https://www.vagrantup.com/docs/provisioning/

When the execution finishes, you may destroy the created virtual machine with the followind command:

```
vagrant destroy -f
```

If something went wrong during the playbook execution, you may enter any of the machines to check what's wrong:

```
vagrant status #List known virtual machines
vagrant ssh [machine name] 
```

## Playbook validation

The Playbooks should have necessary steps to validate its actions. Nevertheless, in this example, each server should expose one html page that can be accessed on the following address (defined by port forwarding in the Vagrantfile):

* [Server 1](http://127.0.0.1:8001/) - Server 1
* [Server 2](http://127.0.0.1:8002/) - Server 2
