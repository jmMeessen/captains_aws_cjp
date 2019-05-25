provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

resource "aws_instance" "jmm_cjoc" {
  ami                         = "${data.aws_ami.ubuntu.id}"
  instance_type               = "t3.medium"
  key_name                    = "${aws_key_pair.my-aws-key.key_name}"
  associate_public_ip_address = true

  security_groups = [
    "${aws_security_group.jmm_general_sg.name}",
    "${aws_security_group.jmm_cjoc_sg.name}",
  ]

  tags {
    Name = "jmm_cjoc"
    Role = "test"
  }
}

resource "aws_instance" "jmm_client_master" {
  ami                         = "${data.aws_ami.ubuntu.id}"
  instance_type               = "t3.medium"
  key_name                    = "${aws_key_pair.my-aws-key.key_name}"
  associate_public_ip_address = true

  security_groups = [
    "${aws_security_group.jmm_general_sg.name}",
    "${aws_security_group.jmm_master_sg.name}",
  ]

  tags {
    Name = "jmm_client_master"
    Role = "test"
  }
}
