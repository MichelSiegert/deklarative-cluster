resource "google_compute_instance" "worker_nodes" {
  count        = var.worker_count
  project      = var.project_id
  zone         = var.zone
  name         = "k8s-worker-node-${count.index}"
  machine_type = "e2-medium"
  hostname     = "k8s-worker-node-${count.index}.local"
  tags         = ["kubernetes", "worker-node"]
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
    role           = "worker-node"
    ssh-keys       = "${var.local_user}:${file("~/.ssh/id_rsa.pub")}"
    startup-script = file("${path.module}/startup.sh")
  }
}
