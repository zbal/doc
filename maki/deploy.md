# Test environment
3 virtual servers, Debian 6 based.

- Maki server - acting also as chef management workstation
- Chef server
- Chef client server

Local APT repository available to speed up deployments.

## Pre-requisite

- The client server is spawned / installed already

## Goal

Being able to manage the client server from the Maki server through the use of knife and the Chef server (and its API).

# Setup

## Setup Chef server
See Chef/Install.md documentation

## Setup chef management workstation
Log on maki server

````
sudo apt-get install ruby ruby-dev libopenssl-ruby rdoc ri irb build-essential wget ssl-cert curl rubygems
````

or install rubygems from source

````
gem install chef --no-ri --no-rdoc
````

Binaries (knife / chef / etc.) are in /var/lib/gems/1.8/bin

````
echo 'export PATH=/var/lib/gems/1.8/bin:$PATH' >> /etc/profile
source /etc/profile
````


create maki user
useradd -m -d /var/maki -s /bin/bash maki

cd ~
git clone git://github.com/opscode/chef-repo.git

