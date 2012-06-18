#!/bin/bash

for id in XXXXXX
do 
    lvcreate -L 6G -n "$id"_xvda balou-server 
    virt-install --name="$id" --ram=256 --nographics --paravirt \
        --disk=/dev/balou-server/"$id"_xvda \
        --location=http://192.168.1.160/debian/dists/squeeze/main/installer-amd64 \
        --extra-args="auto=true interface=eth0 hostname="$id" domain=balou.local url=http://192.168.1.160/preseed/puppet-enabled-debian.cfg"
done

#390  virsh autostart debian-puppet
#471  virsh list --all
#472  virsh destroy mmm-client-1
#473  virsh undefine mmm-client-1