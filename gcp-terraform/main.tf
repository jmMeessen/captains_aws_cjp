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

// A single Google Cloud Engine instance
resource "google_compute_instance" "jmm_cjoc" {
    name         = "jmm-cjoc-${random_id.instance_id.hex}"
    machine_type = "n1-standard-1"

    boot_disk {
        initialize_params {
        image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
}

 metadata_startup_script = "sudo apt-get update"

 metadata = {
   ssh-keys = "jmm:${file("~/.ssh/captains_aws_cjp.pub")}"
 }

 network_interface {
   network = "default"

   access_config {
     // Include this section to give the VM an external ip address
   }
 }
}

resource "google_compute_firewall" "default" {
    name    = "nginx-firewall"
    network = "default"
 
    allow {
        protocol = "tcp"
        ports    = ["22","80","443"]
    }
 
    allow {
        protocol = "icmp"
    }
}