# Quick walk-through guide to install Chef and manage nodes

## Base documentation
http://wiki.opscode.com/display/chef/Installation

# Server setup
## Package dependency
````
apt-get install sudo wget lsb_release
````
## Add repository
````
echo "deb http://apt.opscode.com/ `lsb_release -cs`-0.10 main" | sudo tee /etc/apt/sources.list.d/opscode.list
````
## Add GPG key of the repo
````
sudo mkdir -p /etc/apt/trusted.gpg.d
gpg --keyserver keys.gnupg.net --recv-keys 83EF826A
gpg --export packages@opscode.com | sudo tee /etc/apt/trusted.gpg.d/opscode-keyring.gpg > /dev/null
````

## Update the repo
apt-get update

## Maintain the GPG key up-to-date
apt-get install opscode-keyring

## Upgrade the distrib
apt-get upgrade

## Install chef and chef-server
apt-get install chef chef-server

This will install the following: 

- Couchdb
- RabbitMQ
- Merq

And start the appropriate services.

This install downloads 250 of packages for 650MB used on the disk.

## Configure chef
Doing the apt-get install will also start the configuration of the tool.

### URL of Chef Server:

- http://192.168.1.163:4000

### Chef-solr
This will be used in /etc/chef/solr.rb and /etc/chef/server.rb as 'amqp_pass'.

Password:

- chefpass or chef_pass ?

### Chef-server-webui
This will only be used to prepare the configuration file of the Chef-server-webui, it does not create the user per-se on chef server (see next section).

WebUI in fact is a client that can be ran locally or remotely and make use of the Chef's API

Admin user: 

- admin / admin

## Configure Chef CLI
This step will configure and create users / certificate for the API / CLI / WebUI, etc.

mkdir -p ~/.chef
sudo cp /etc/chef/validation.pem /etc/chef/webui.pem ~/.chef
sudo chown -R $USER ~/.chef

knife configure -i

REPLACE the default path provided by the path of the user .chef/ !

