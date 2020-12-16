#!/usr/bin/env bash
TFVER="0.13.5"
KUBCTLVER="https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.9/2020-11-02/bin/linux/amd64/kubectl"
IAMAUTHVER="https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.9/2020-11-02/bin/linux/amd64/aws-iam-authenticator"

## PRE CONFIG
mkdir -p $HOME/bin

######## Installing tools
## TFENV
git clone https://github.com/tfutils/tfenv.git ~/.tfenv
sudo ln -s ~/.tfenv/bin/* /usr/local/bin
tfenv install $TFVER
tfenv use $TFVER

### Kubectl
curl -o kubectl $KUBCTLVER
chmod +x ./kubectl
cp ./kubectl $HOME/bin/kubectl

### IAM Authenticator
curl -o aws-iam-authenticator $IAMAUTHVER
chmod +x ./aws-iam-authenticator
cp ./aws-iam-authenticator $HOME/bin/aws-iam-authenticator

### Nano
sudo yum install -y nano

######## Copy files
sudo cp ./config_files/.git-prompt.sh ~/.git-prompt.sh
sudo cp ./config_files/custom_bash_profile ~/.bash_profile

source ~/.bash_profile