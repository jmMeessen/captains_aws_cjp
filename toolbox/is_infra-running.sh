#aws --region us-east-1 --profile cloudbees-ps  ec2 describe-instances --filters Name=tag:Owner,Values=Jmm --output text --query "Reservations[].Instances[].[InstanceId]"
aws --region us-east-1 --profile cloudbees-ps  ec2 describe-instances --filters Name=tag:Owner,Values=Jmm --output text --query "Reservations[].Instances[].Tags[?Key==\`Name\`].Value"
