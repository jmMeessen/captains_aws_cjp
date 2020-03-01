#backend make sure to change bucket name 
terraform {
  backend "s3" {
    bucket = "terraform.jmm.eu"
    key    = "terraform/jmm/captains_aws_cjp.tfstate"
    region = "us-east-1"
  }
}

