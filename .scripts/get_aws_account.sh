grep "AWS_PROFILE" ~/.shell.config/terraform.sh | awk -F '=' '{print $2}'
