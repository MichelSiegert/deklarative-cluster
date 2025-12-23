output "control_plane_ip" {
  value       = google_compute_instance.control_plane_node.network_interface[0].access_config[0].nat_ip
  description = "Contains the IP of the control plane"
}

output "worker_node_ips" {
  value       = [for w in google_compute_instance.worker_nodes : w.network_interface[0].access_config[0].nat_ip]
  description = "List of NAT IPs of all Worker nodes"
}
