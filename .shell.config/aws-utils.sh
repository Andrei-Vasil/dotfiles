alias bastionhostproxy='ssh -fND 1081 -q -N $(aws ec2 describe-instances --filters "Name=tag:Name,Values=bastion-host" --query "Reservations[*].Instances[*].[InstanceId]" --output text)'
alias awsenv='~/.scripts/switch-aws-env/run.sh && source ~/.zshrc'

export KUBE_PROXY_URL="socks5://127.0.0.1:1081"