#!/usr/bin/env python3

import sys
import boto3
import json
import socket

# Get the IP address of the localhost
localhost_ip = socket.gethostbyname(socket.gethostname())

# Initialize empty inventory
inventory = {
    "_meta": {
        "hostvars": {}
    }
}

# Connect to AWS EC2
ec2 = boto3.resource('ec2')

# Get all instances
instances = ec2.instances.all()

# Loop through instances
for instance in instances:
    # Get instance name
    instance_name = None
    for tag in instance.tags:
        if tag['Key'] == 'Name':
            instance_name = tag['Value']
            break

    # Skip instances without a name tag or if private_ip_address matches localhost
    if instance_name is None or instance.private_ip_address == localhost_ip:
        continue

    # Populate inventory
    inventory[instance_name] = {
        "ansible_host": instance.public_ip_address
    }

# Output inventory as JSON
print(json.dumps(inventory))
