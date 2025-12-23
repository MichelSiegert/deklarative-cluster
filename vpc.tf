resource "google_compute_network" "vpc_network" {
  project                 = var.project_id
  routing_mode            = "REGIONAL"
  name                    = "vpc-ckad"
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "vpc_subnetwork" {
  name          = "vpc-subnet-ckad"
  region        = var.region
  ip_cidr_range = "10.2.0.0/24"
  network       = google_compute_network.vpc_network.id
}
