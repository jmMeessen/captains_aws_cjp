# Retrieves and stores the public IP 

resource "aws_eip" "jmm_test-eip" {
  instance = "${aws_instance.jmm_test.id}"
}
