#!/usr/bin/env bash
TFVER="0.14.11"
KUBCTLVER="https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.9/2020-11-02/bin/linux/amd64/kubectl"
IAMAUTHVER="https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.9/2020-11-02/bin/linux/amd64/aws-iam-authenticator"

TOOLS=("nano" "bind-utils" "bash-completion")

## PRE CONFIG
sudo mkdir -p $HOME/bin
sudo mkdir -p $HOME/tmp

######## Installing tools
## TFENV
if [ ! -f ~/.tfenv/bin/tfenv ]; then
git clone https://github.com/tfutils/tfenv.git ~/.tfenv
sudo ln -s ~/.tfenv/bin/* /usr/local/bin
tfenv install $TFVER
tfenv use $TFVER
fi

### Kubectl
if [ ! -f $HOME/bin/kubectl ]; then
   sudo curl -o $HOME/tmp/kubectl $KUBCTLVER
    sudo chmod +x $HOME/tmp/kubectl
    sudo cp $HOME/tmp/kubectl $HOME/bin/kubectl
fi

### IAM Authenticator
if [ ! -f $HOME/bin/aws-iam-authenticator ]; then
   sudo curl -o $HOME/tmp/aws-iam-authenticator $IAMAUTHVER
    sudo chmod +x $HOME/tmp/aws-iam-authenticator
    sudo cp $HOME/tmp/aws-iam-authenticator $HOME/bin/aws-iam-authenticator
fi

### Tools

if command -v apt-get >/dev/null; then
    for tool in ${TOOLS[@]};
    do
        sudo apt-get -y install $tool
    done
fi 

if command -v yum >/dev/null; then
    for tool in ${TOOLS[@]};
    do
        sudo yum install -y $tool
    done
fi

######## Copy files
sudo cp ./config/.git-prompt.sh ~/
sudo cp ./config/custom_bash_profile ~/.bash_profile

######## Reload Shell
source ~/.bash_profile
