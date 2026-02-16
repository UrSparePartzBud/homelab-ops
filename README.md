# homelab-ops
Infrastructure as Code (IaC) repository for a bare-metal Kubernetes cluster (K3s). This project documents the automation, auditing, and deployment workflows for a 3-node Optiplex cluster.

## 🚀 Project Overview
* **Hardware:** 3x Dell Optiplex Small Form Factor PCs
* **OS:** Ubuntu Server 24.04 LTS
* **Distribution:** K3s (Lightweight Kubernetes)
* **Control Plane:** k3s-node-01 (192.168.4.93)
* **Workers:** k3s-node-02 (192.168.4.102), k3s-node-03 (192.168.4.105)

---

## 🛠️ Modules & Accomplishments

### Module 1: Ansible Infrastructure Mapping
**Objective:** Establish a secure, automated management channel.
* Configured passwordless SSH access using ED25519 keys.
* Created a dynamic `inventory.ini` to manage the cluster as a single unit.
* Verified fleet connectivity using the Ansible `ping` module.

### Module 2: Kubernetes Security & Auditing
**Objective:** Securely connect workstation to control plane and audit workloads.
* Migrated `kubeconfig` from the control plane to macOS workstation.
* Developed `cluster-census.sh`, a Bash script to automate health reporting and namespace auditing.
* Verified active status for critical add-ons: Traefik, CoreDNS, and Longhorn.

### Module 3: Highly Available Deployments
**Objective:** Deploy a fault-tolerant web application.
* Implemented a declarative YAML manifest for a 3-replica Nginx deployment.
* Configured a `LoadBalancer` service for network ingress.
* Successfully validated application health via `kubectl port-forward` to `localhost:8080`.

---

## 📈 Next Steps
* **Module 4:** Automating mass system updates across all nodes using Ansible Playbooks.
* **Module 5:** Implementing persistent storage volumes via Longhorn.
