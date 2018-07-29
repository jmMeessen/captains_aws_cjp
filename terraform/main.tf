provider "aws" {
  #region = "us-east-1"
  alias = "default"
}

resource "aws_instance" "jmm_test" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  associate_public_ip_address = true

  tags {
    Name = "Jmm_test"
  }
}
