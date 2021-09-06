#!/bin/bash

set -xe

USERNAME=$1

mkdir -p /home/${USERNAME}/data/rvm

echo 'Files here are expected to be mounted across containers' > /home/${USERNAME}/data/README

# Symlink RVM directory to ~/data so it persists across container restarts
sudo -u ${USERNAME} ln -nfs /home/${USERNAME}/data/rvm /home/${USERNAME}/.rvm
chown ${USERNAME}:${USERNAME} -R /home/${USERNAME}/data

# Enable RVM mixed mode so gems are stored in ~/.rvm (actually, ~/data/rvm)
sudo -u ${USERNAME} bash --login -c 'rvm user gemsets'