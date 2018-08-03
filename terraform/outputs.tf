output "Jmm_cjoc ip" {
  value = "${aws_instance.jmm_cjoc.public_ip}"
}

output "Jmm_cjoc dns" {
  value = "${aws_instance.jmm_cjoc.public_dns}"
}

output "Jmm_master ip" {
  value = "${aws_instance.jmm_client_master.public_ip}"
}

output "Jmm_master dns" {
  value = "${aws_instance.jmm_client_master.public_dns}"
}
