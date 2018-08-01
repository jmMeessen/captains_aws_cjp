provider "aws" {
  #region = "us-east-1"
  alias = "default"
}

resource "aws_instance" "jmm_cjoc" {
  ami                         = "${data.aws_ami.ubuntu.id}"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.my-aws-key.key_name}"
  associate_public_ip_address = true

  security_groups = [
    "${aws_security_group.jmm_sg.name}",
  ]

  tags {
    Name = "Jmm_cjoc"
    Role = "test"
  }
}
