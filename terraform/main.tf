provider "aws" {
  #version = "~> 2.0"
  region  = var.aws_region
  profile = var.aws_profile
}

resource "aws_instance" "jmm_cjoc" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.medium"
  key_name                    = aws_key_pair.my-aws-key.key_name
  associate_public_ip_address = true

  security_groups = [
    aws_security_group.jmm_general_sg.name,
    aws_security_group.jmm_cjoc_sg.name,
    aws_security_group.jmm_ldap_sg.name
  ]

  tags = {
    Name = "jmm_cjoc"
    Role = "test"
    Owner = "Jmm"
    "cb:owner" = "user:Jmm"
  }
}

resource "aws_instance" "jmm_client_master" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.medium"
  key_name                    = aws_key_pair.my-aws-key.key_name
  associate_public_ip_address = true

  security_groups = [
    aws_security_group.jmm_general_sg.name,
    aws_security_group.jmm_master_sg.name,
    aws_security_group.jmm_master_outbound_sg.name,
    aws_security_group.jmm_ldap_sg.name
  ]

  tags = {
    Name = "jmm_client_master"
    Role = "test"
    Owner = "Jmm"
    "cb:owner" = "user:Jmm"
  }
}

resource "aws_instance" "jmm_agent1" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.medium"
  key_name                    = aws_key_pair.my-aws-key.key_name
  associate_public_ip_address = true

  security_groups = [
    aws_security_group.jmm_general_sg.name,
    aws_security_group.jmm_master_sg.name,
    aws_security_group.jmm_agent_docker_sg.name
  ]

  tags = {
    Name = "jmm_agent1"
    Role = "test"
    Owner = "Jmm"
    "cb:owner" = "user:Jmm"
  }
}

resource "aws_instance" "jmm_agent_docker" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.medium"
  key_name                    = aws_key_pair.my-aws-key.key_name
  associate_public_ip_address = true

  security_groups = [
    aws_security_group.jmm_general_sg.name,
    aws_security_group.jmm_master_sg.name,
    aws_security_group.jmm_agent_docker_sg.name
  ]

  tags = {
    Name = "jmm_agent_docker"
    Role = "test"
    Owner = "Jmm"
    "cb:owner" = "user:Jmm"
  }
}

resource "aws_instance" "jmm_SDA" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.xlarge"
  key_name                    = aws_key_pair.my-aws-key.key_name
  associate_public_ip_address = true

  security_groups = [
    aws_security_group.jmm_general_sg.name,
    aws_security_group.jmm_cjoc_sg.name,
    aws_security_group.jmm_sda_sg.name
  ]

  tags = {
    Name = "jmm_SDA"
    Role = "test"
    Owner = "Jmm"
    "cb:owner" = "user:Jmm"
  }
}

resource "aws_instance" "jmm_SDA2" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.medium"
  key_name                    = aws_key_pair.my-aws-key.key_name
  associate_public_ip_address = true

  security_groups = [
    aws_security_group.jmm_general_sg.name,
    aws_security_group.jmm_cjoc_sg.name,
    aws_security_group.jmm_sda_sg.name
  ]

  tags = {
    Name = "jmm_SDA2"
    Role = "test"
    Owner = "Jmm"
    "cb:owner" = "user:Jmm"
  }
}