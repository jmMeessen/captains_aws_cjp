#Quick notes

- to configure the CB AWS environment with OPSCORE: `opscore iam refresh --account cloudbees-support --role infra-admin`

- to open the console on AWS:
  - `https://console.aws.amazon.com/iam/home?region=us-east-1#/users/jmeessen`
  - switch to `infa-admin @ cloudbees-support`

- initialise Terraform workinf directory: `terraform init`
- Sanity check: verify with `terraform plan`
- Start the environment: `terraform apply`
- Pull the environement down: `terraform destroy`

- generate an SSH key with `ssh-keygen -t rsa -b 2048 -v` in the `~/.ssh` directory.
- copy the public key in the terraform directory so that it can be found in the scripts
- connect to the server with `ssh <ip-address> -l ubuntu -i ~/.ssh/captains_aws_cjp`