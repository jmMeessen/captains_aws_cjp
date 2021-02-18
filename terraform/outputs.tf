output "Jmm_cjoc_ip" {
  value = aws_instance.jmm_cjoc.public_ip
}

output "Jmm_cjoc_dns" {
  value = aws_instance.jmm_cjoc.public_dns
}

output "Jmm_master_ip" {
  value = aws_instance.jmm_client_master.public_ip
}

output "Jmm_master_dns" {
  value = aws_instance.jmm_client_master.public_dns
}

output "Jmm_agent1_ip" {
  value = aws_instance.jmm_agent1.public_ip
}

output "Jmm_agent1_dns" {
  value = aws_instance.jmm_agent1.public_dns
}

output "Jmm_agent2_ip" {
  value = aws_instance.jmm_agent2.public_ip
}

output "Jmm_agent2_dns" {
  value = aws_instance.jmm_agent2.public_dns
}

output "Jmm_agent3_ip" {
  value = aws_instance.jmm_agent3.public_ip
}

output "Jmm_agent3_dns" {
  value = aws_instance.jmm_agent3.public_dns
}

output "Jmm_agent4_ip" {
  value = aws_instance.jmm_agent4.public_ip
}

output "Jmm_agent4_dns" {
  value = aws_instance.jmm_agent4.public_dns
}
output "Jmm_agent_docker_ip" {
  value = aws_instance.jmm_agent_docker.public_ip
}

output "Jmm_agent_docker_dns" {
  value = aws_instance.jmm_agent_docker.public_dns
}