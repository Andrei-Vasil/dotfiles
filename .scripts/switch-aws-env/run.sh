#!/bin/zsh

# switch aws account
pip install -q -r ~/.scripts/switch-aws-env/requirements.txt
touch /tmp/switch-aws-env.txt
python3 ~/.scripts/switch-aws-env/switch-aws-profile.py
source ~/.zshrc
python3 ~/.scripts/switch-aws-env/config-cluster.py
rm /tmp/switch-aws-env.txt

# start bastion host proxy
~/.scripts/start-bastion-host-proxy.sh