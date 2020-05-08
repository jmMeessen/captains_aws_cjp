#variable "project" { }

variable "region" {
  default ="europe-west1"
}


variable "name" {
  description = "The name of the cluster (required)"
  default     = "jx-openshift-311"
}

variable "compute_machine_type" {
  default = "n1-standard-4"
}

variable "master_machine_type" {
  default = "n1-standard-1"
}

variable "instance_prefix" {
    default ="jmm-cjp"
}


variable "vm_image" {
  default ="ubuntu-os-cloud/ubuntu-1804-lts"
}

variable "master_zone" {
    description = "Zone in which the Master Node will be created"
    default = "europe-west1-b"
}

variable "zone" {
    default = "europe-west1-b"
}


# variable "uc1_public_subnet" {
#       default = "10.26.2.0/24"
# }
# variable "ue1_private_subnet" {
#       default = "10.26.3.0/24"
# }
# variable "ue1_public_subnet" {
#     default = "10.26.4.0/24"
# }