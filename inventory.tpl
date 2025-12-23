[k8s_control]
${control_plane_ip}

[k8s_workers]
%{ for ip in worker_node_ips ~}
${ip}
%{ endfor ~}

[k8s:children]
k8s_control
k8s_workers

[all:vars]
ansible_user=michelsiegert
ansible_ssh_private_key_file=/home/michelsiegert/.ssh/id_rsa
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
local_registry=10.97.40.62:5000