#!/bin/zsh

RED='\e[31m'
RESET='\e[0m'

display_time() {
  while true; do
    current_time=$(date +%s)
    elapsed=$((current_time - start_time))
    printf "\rStarting bastion host proxy, this might take a while... %ds" $elapsed
    sleep 1
  done
}

if [ -z $(aws ec2 describe-instances --filters "Name=tag:Name,Values=bastion-host" --query "Reservations[*].Instances[*].[InstanceId]" --output text) ]; then
  echo -e "${RED}[ERR] Can't setup proxy: Your cloudroom doesn't have a bastion host${RESET}"
  exit 1
fi

# close any proxies already running on port 1081
proxy_pid=$(lsof -ti:1081)
if [ ! -z ${proxy_pid+x} ]; then
  kill -9 $proxy_pid > /dev/null 2>&1
fi

# start bastion host proxy on port 1081
start_time=$(date +%s)
display_time &
timer_pid=$!
ssh -fND 1081 -q -N $(aws ec2 describe-instances --filters "Name=tag:Name,Values=bastion-host" --query "Reservations[*].Instances[*].[InstanceId]" --output text)
kill $timer_pid
echo
echo "Bastion host proxy running on port 1081"