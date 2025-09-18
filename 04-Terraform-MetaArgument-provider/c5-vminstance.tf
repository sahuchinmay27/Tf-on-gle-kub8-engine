resource "google_compute_instance" "myaap1" {
  name = "myapp1"
  machine_type = "e2-micro"
  zone = "europe-north2-a"
  #tags = ["ssh-tag","webserver-tag"]  another way to define
  tags = [tolist(google_compute_firewall.fw_ssh.target_tags)[0],tolist(google_compute_firewall.fw_http.target_tags)[0]]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  #add webserver script
  metadata_startup_script = file("${path.module}/app1-webserver-install.sh")

  network_interface {
    subnetwork = google_compute_subnetwork.mysubnet.id
    access_config {

    }

  }
}
