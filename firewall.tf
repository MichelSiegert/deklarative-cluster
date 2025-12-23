resource "google_compute_firewall" "all-ingress" {
  project     = var.project_id
  name        = "all-ingress"
  network     = google_compute_network.vpc_network.name
  description = "Firewall die allen ingress erlaubt"
  direction   = "INGRESS"

  allow {
    protocol = "all"

  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["kubernetes"]

}


resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.vpc_network.name
  project = var.project_id

  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["kubernetes"]
}
