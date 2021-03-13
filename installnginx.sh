#!/bin/bash

#sleep until the instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished]]; do
    sleep 1
done

# install nginx
apt-get update
apt-get install nginx

# start nginx service
service nginx start