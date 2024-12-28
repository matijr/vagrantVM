#! /bin/bash

# Install DevOps Tools
python3 -m pip install --upgrade pip
python3 -m pip install ansible

# Run ansible playbook
ansible-playbook -i localhost, -c local /vagrant_data/scripts/tools.yaml

# Install VS Code
rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | tee /etc/yum.repos.d/vscode.repo > /dev/null
yum check-update
yum install -y code

    