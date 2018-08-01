# Retrieves and stores the public IP 

resource "aws_eip" "jmm_cjoc-eip" {
  instance = "${aws_instance.jmm_cjoc.id}"
}
