output "server-ip" {
  value = "${aws_eip.jmm_cjoc-eip.public_ip}"
}
