provider "google" {
    credentials = file("~/gcloud-account.json")
    region      = "europe-west1"
    zone        = "europe-west1-b"
    project     = "ps-dev-201405"
}

// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
    byte_length = 8
}

module "vpc" {
  source = "./modules/vpc"
  region = var.region
  vpc_name = "vpc-jmm-cjp"
  network_name_int = "network-jmm-cjp-int"
  network_name_ext = "network-jmm-cjp-ext"
}


module "CJOC" {
  source = "./modules/instance"
  machine_type = "n1-standard-1"
  instance_name = "cjoc"
  prefix = var.instance_prefix
  network = module.vpc.vpc_link
  vpc_subnet_int = module.vpc.vpc_subnet_int
  vpc_subnet_ext = module.vpc.vpc_subnet_ext
  zone = var.zone
  ssh_key = "ansible:${file("~/.ssh/captains_aws_cjp.pub")}"
}






# // A single Google Cloud Engine instance
# resource "google_compute_instance" "jmm_cjoc" {
#     name         = "jmm-cjoc-${random_id.instance_id.hex}"
#     machine_type = "n1-standard-1"

#     boot_disk {
#         initialize_params {
#         image = "ubuntu-os-cloud/ubuntu-1804-lts"
#     }
# }
