resource "google_compute_instance" "myaap1" {
  name = "myapp1"
  machine_type = "e2-micro"
  zone = "europe-north2"
  #tags = ["ssh-tag","webserver-tag"]  another way to define
  tags = [tolist(google_compute_firewall.fw_ssh.target_tags)[0],tolist(google_compute_firewall.fw_http.target_tags)[0]]

}