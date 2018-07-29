resource "aws_key_pair" "my-aws-key" {
  key_name   = "aws-key"
  public_key = "${file("captains_aws_cjp.pub")}"
}
