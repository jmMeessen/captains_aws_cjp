output "Jmm_cjoc_ip" {
  value = "${google_compute_instance.jmm_cjoc.network_interface.0.network_ip}"
}

output "Jmm_cjoc_dns" {
  value = "${google_compute_instance.jmm_cjoc.self_link}"
}