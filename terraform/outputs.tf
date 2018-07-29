output "server-ip" {
  value = "${aws_eip.jmm_test-eip.public_ip}"
}
