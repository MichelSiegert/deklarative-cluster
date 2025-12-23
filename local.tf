resource "local_file" "ansible_inventory" {
  depends_on = [google_compute_instance.worker_nodes , google_compute_instance.control_plane_node]
  filename   = "${path.module}/inventory.ini"

  content = templatefile("${path.module}/inventory.tpl", {
    control_plane_ip = google_compute_instance.control_plane_node.network_interface[0].access_config[0].nat_ip
    worker_node_ips  = [for w in google_compute_instance.worker_nodes : w.network_interface[0].access_config[0].nat_ip]
  })
}

resource "null_resource" "wait_for_ssh" {
  depends_on = [local_file.ansible_inventory]

  for_each = merge(
    { control_plane = google_compute_instance.control_plane_node.network_interface[0].access_config[0].nat_ip },
    { for i, w in google_compute_instance.worker_nodes : "worker_${i}" => w.network_interface[0].access_config[0].nat_ip }
  )

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = each.value
      user        = var.local_user
      private_key = file("~/.ssh/id_rsa")
      timeout     = "5m"
    }

    inline = [
      "echo 'VM ${each.key} is ready'"
    ]
  }
}



resource "null_resource" "setup_kubernetes" {
  depends_on = [null_resource.wait_for_ssh]
  provisioner "local-exec" {
    command = "ansible-playbook -i inventory.ini ansible/site.yml"
  }
}
