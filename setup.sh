#!/bin/bash

# Install wsl on Windows

# Ubuntu

sudo apt-get update

​## ssh

mkdir .ssh
cd .ssh
ssh-keygen -t rsa

echo '' >> .bash_profile
echo '# start ssh-agent' >> .bash_profile
echo 'if [ -z "${SSH_AGENT_PID}" ]; then' >> .bash_profile
echo '    eval $(ssh-agent) 1>/dev/null' >> .bash_profile
echo '    ssh-add ~/.ssh/id_rsa 1>/dev/null' >> .bash_profile
echo 'fi' >> .bash_profile
echo '' >> .bash_profile
source .bash_profile

echo '' >> .bash_logout
echo '# kill ssh-agent' >> .bash_logout
echo 'if [ -n "${SSH_AGENT_PID}" ]; then' >> .bash_logout
echo '    eval $(ssh-agent -k) 1>/dev/null' >> .bash_logout
echo 'fi' >> .bash_logout
echo '' >> .bash_logout

## Git 

cd ~/

echo -n GIT_USER: 
read GIT_USER
git config --global user.name ${GIT_USER}
echo -n GIT_EMAIL: 
read GIT_EMAIL
git config --global user.email ${GIT_EMAIL}

###  GitHub

ssh -T git@github.com

# Download repositories

cd ~/

mkdir repository
cd repository/
​
git clone git@github.com:GOAMI-Takaaki/tools
git clone git@github.com:GOAMI-Takaaki/rust-by-example-ja
git clone git@github.com:GOAMI-Takaaki/google-task-creator
git clone git@github.com:GOAMI-Takaaki/serverless-application-boilerplate
​