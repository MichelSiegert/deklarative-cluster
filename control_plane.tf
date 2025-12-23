resource "google_compute_instance" "control_plane_node" {
  project      = var.project_id
  zone         = var.zone
  name         = "k8s-control-plane"
  machine_type = "e2-medium"
  hostname     = "k8s-control-plane.local"
  tags         = ["kubernetes", "control-plane"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = 40
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.vpc_subnetwork.id
    access_config {}
  }

  metadata = {
    role           = "control-plane"
    ssh-keys       = "${var.local_user}:${file("~/.ssh/id_rsa.pub")}"
    startup-script = file("${path.module}/startup.sh")
  }

}
