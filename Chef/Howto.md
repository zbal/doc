# Howto setup a host
## Pre-requisite

- running Chef server
- running Chef workstation
- client server already installed

All the commands are running from the Chef workstation

## Create new chef client

```
knife client create CLIENT_NAME
```

Keep the defaults (for now)

## Get the community cookbooks

### Edit .chef/knife.rb, append: 
```
cookbook_path [File.join(File.dirname(__FILE__), "..", "chef-repo", "cookbooks")]
```

### Install the cookbooks
```
knife cookbook site install php-fpm
knife cookbook site install php
knife cookbook site install mysql
knife cookbook site install nginx
```

Cookbooks get the attributes, recipe for installation, etc.

## Build the 

## Attach a node to the server
This is made though the bootstrap process or during the instantiation of a server if started from Chef.

knife bootstrap IP.address -x username -N client1.fqdn -r roles_to_apply -d template_distro -

It will download many things from opscode / internet, perform the setup of the chef-client and create basic config on the client in /etc/chef

accessing some of the config is made as root

sudo knife role list -c /etc/chef/client.rb



## Try fro