output "Server-ip" {
  value = "${aws_instance.jmm_cjoc.public_ip}"
}

output "Server-dns" {
  value = "${aws_instance.jmm_cjoc.public_dns}"
}
