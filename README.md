# homelab-ops
Infrastructure as Code (IaC) repository for a bare-metal Kubernetes cluster (K3s). This project documents the automation, auditing, and deployment of a 3-node high-availability fleet.

## 🚀 Project Overview
* **Hardware:** 3x Dell Optiplex Small Form Factor PCs
* **OS:** Ubuntu Server 24.04 LTS
* **Distribution:** K3s (Lightweight Kubernetes)
* **Management Nickname:** Garfield

### Cluster Nodes
| Hostname | IP Address | Role |
| :--- | :--- | :--- |
| `k3s-node-01` | 192.168.4.93 | Control Plane |
| `k3s-node-02` | 192.168.4.102 | Worker |
| `k3s-node-03` | 192.168.4.105 | Worker |

---

## 🛠️ Modules & Accomplishments

### Module 1: Ansible Infrastructure Mapping
* Established secure management via ED25519 SSH keys.
* Developed `inventory.ini` to manage the fleet as a single logical unit.
* Automated connectivity verification using Ansible ad-hoc modules.

### Module 2: Security & Auditing
* Secured full cluster administrator access from a remote macOS workstation.
* Developed `cluster-census.sh`, a custom Bash script for automated health reporting.
* Implemented `.gitignore` logic to ensure system logs/reports remain outside of version control.

### Module 3: High-Availability Deployments
* Deployed a 3-replica Nginx web server ("Construction by Garfield") across the fleet.
* Utilized Kubernetes `Namespaces` for workload isolation.
* Configured `LoadBalancer` services and validated ingress via `kubectl port-forward`.

### Module 4: Fleet Automation & Maintenance
* Implemented a "Master" Ansible Playbook (`apt-update.yaml`) for rolling system updates.
* **Zero-Downtime Logic:** Utilized `serial: 1` to ensure only one node is offline at a time.
* Automated kernel update detection and intelligent node reboots.

### Module 5: Distributed Persistence (Longhorn)
* **Status:** Fully Operational.
* Deployed 27 pods to manage a distributed block storage layer across all nodes.
* Enabled persistent volume replication to ensure data survives hardware failures.

---

## 📈 Next Steps
* **External Ingress:** Configuring Traefik to route external traffic via custom domains (e.g., `myholodeck.org`).
* **CI/CD:** Automating manifest updates directly from GitHub Actions.
* **Creative Projects:** Integrating the "Redwood" cartoon project and AI media scripts into the cluster.
