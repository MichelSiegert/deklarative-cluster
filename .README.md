# Deklaratives Kubernetes-Bootstrap  (Terraform +Ansible)

## About
Dieses Projekt ist zur Automatisierung für das aufsetzen eines Clusters. Dieses Projekt erzeugt zzt. Ubuntu 2204 VMs als base. 

Dieses Projekt automatisiert die Bereitstellung von Linux-VMs auf Google Cloud und richtet sie als Kubernetes-fähige Nodes ein, mithilfe von **Terraform** und **Ansible**. Es ermöglicht eine schnelle Bereitstellung einer skalierbaren Kubernetes-Umgebung mit minimalem manuellem Aufwand.

## Funktionen

- Bereitstellung von **2 bis N VMs** auf Google Cloud, basierend auf der angegebenen Anzahl an Worker-Nodes.
- Verwendung von **Terraform** zur Erstellung der Infrastruktur.
- Verwendung von **Ansible** zur:
- Installation von Container-Runtimes (`containerd` / Podman)
- Installation von Kubernetes-Paketen (`kubeadm`, `kubelet`, `kubectl`)
- Vollständig automatisierte Einrichtung der VMs, bereit zum Beitritt in einen Kubernetes-Cluster.
- In cluster Repo für das bauen von in Cluster Images.
- lfs für PersistentVolumes



## Voraussetzungen

- [Terraform](https://www.terraform.io/) >= 1.5  
- [Ansible](https://www.ansible.com/) >= 2.14  
- Google Cloud Konto mit **Service-Account-Zugangsdaten** für Terraform.  
- `gcloud` CLI installiert und authentifiziert.

## Features welche ich noch Integrieren muss:
- Alle features optional machen für Prod / Test 
- Linkerd/Istio als Service Mesh
- Observability stack
    - Jäger
    - OPT
    - Prometheus
    - Grafana
- Helm
- kleineres OS verwenden.