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

