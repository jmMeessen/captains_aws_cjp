output "Jmm_cjoc_ip" {
  value = "${aws_instance.jmm_cjoc.public_ip}"
}

output "Jmm_cjoc_dns" {
  value = "${aws_instance.jmm_cjoc.public_dns}"
}

output "Jmm_master_ip" {
  value = "${aws_instance.jmm_client_master.public_ip}"
}

output "Jmm_master_dns" {
  value = "${aws_instance.jmm_client_master.public_dns}"
}
