#!/bin/bash

if [ ! -f /var/log/first_boot_done ]; then

    yum update -y
    yum install -y docker
    systemctl start docker
    systemctl enable docker

    touch /var/log/first_boot_done
fi
