# aws-cloudshell-config
Project is a simple script and set of config files to easily configure any bash shell with a desired set of configuration

In this case the goal is to all one to launch an AWS CloudShell, run a one liner, and have all the tools needed to work in the shell
## Command
```
git clone https://github.com/danno-rose/aws-cloudshell-config.git && cd aws-cloudshell-config && . create_env.sh
```

## Installs
- Terraform
- Terraform ENV manager
- Kubectl
- AWS IAM Authenticator
- Nano
- Bind-Utils (dig etc)
- Bash-Completion

## Configures
Updates the local bash_profile to use the one included in the in the config folder
