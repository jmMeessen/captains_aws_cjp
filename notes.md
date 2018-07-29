#Quick notes

- to configure the CB AWS environment with OPSCORE: `opscore iam refresh --account cloudbees-support --role infra-admin`

- to open the console on AWS:
  - `https://console.aws.amazon.com/iam/home?region=us-east-1#/users/jmeessen`
  - switch to `infa-admin @ cloudbees-support`

- initialise Terraform workinf directory: `terraform init`
- Sanity check: verify with `terraform plan`
- Start the environment: `terraform apply`
- Pull the environement down: `terraform destroy`