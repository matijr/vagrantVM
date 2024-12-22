#! /bin/bash

#Install DevOps Tools
yum install -y \
    git \
    Docker \
    Kubernetes \
    Minikube \
    Helm \
    AWS-CLI \
    Terraform \
    Ansible

#Install VS Code
wget https://go.microsoft.com/fwlink/?LinkID=760868 -O /tmp/vscode.rpm
yum install -y /tmp/vscode.rpm

    