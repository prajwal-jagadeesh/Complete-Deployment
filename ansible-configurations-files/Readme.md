Path to aws_ec2.py dynamic inventory = /opt/ansible/inventory/aws_ec2.py
Change in /etc/ansible/ansible.cfg
[defaults]
inventory= /opt/ansible/inventory/aws_ec2.py
enable_plugins= aws_ec2, host_list, script, auto, yaml, ini, toml