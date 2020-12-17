#!/usr/bin/env bash
TFVER="0.13.5"
KUBCTLVER="https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.9/2020-11-02/bin/linux/amd64/kubectl"
IAMAUTHVER="https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.9/2020-11-02/bin/linux/amd64/aws-iam-authenticator"

TOOLS=(
    "nano"
    "bind-utils"
    "bash-completion"
)

## PRE CONFIG
mkdir -p $HOME/bin
mkdir -p $HOME/tmp

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
    curl -o $HOME/tmp/kubectl $KUBCTLVER
    chmod +x $HOME/tmp/kubectl
    cp $HOME/tmp/kubectl $HOME/bin/kubectl
fi

### IAM Authenticator
if [ ! -f $HOME/bin/aws-iam-authenticator ]; then
    curl -o $HOME/tmp/aws-iam-authenticator $IAMAUTHVER
    chmod +x $HOME/tmp/aws-iam-authenticator
    cp $HOME/tmp/aws-iam-authenticator $HOME/bin/aws-iam-authenticator
fi

### Tools
for tool in ${TOOLS[@]};
    if command -v apt-get >/dev/null; then
        sudo apt-get -y install $tool
    elif command -v yum >/dev/null; then
        sudo yum install -y $tool 
    else
        echo "I have no Idea what im doing here"
fi

######## Copy files
sudo cp ./config/.git-prompt.sh ~/
sudo cp ./config/custom_bash_profile ~/.bash_profile

######## Reload Shell
source ~/.bash_profile