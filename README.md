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
* Deployed a 3-replica Nginx web server across the fleet to ensure service availability.
* Utilized Kubernetes `Namespaces` for logical workload isolation.
* Configured `LoadBalancer` services and validated ingress via `kubectl port-forward`.

### Module 4: Fleet Automation & Maintenance
* Implemented a "Master" Ansible Playbook (`apt-update.yaml`) for rolling system updates.
* **Zero-Downtime Logic:** Utilized `serial: 1` to ensure high availability during maintenance windows.
* Automated kernel update detection and intelligent node reboots.

### Module 5: Distributed Persistence (Longhorn)
* **Status:** Fully Operational.
* Deployed 27 pods to manage a distributed block storage layer across all nodes.
* Enabled persistent volume replication to ensure data survives hardware failures.

### Module 6: Observability & Metrics
* Leveraged Kubernetes Metrics Server to implement real-time resource tracking.
* Developed automation scripts to audit CPU/Memory utilization across the 3-node fleet for capacity planning.

---

## 📈 Next Steps
* **Ingress Controller Configuration:** Implementing Traefik to route production traffic via custom domains and SSL/TLS termination.
* **CI/CD Integration:** Developing GitHub Actions pipelines for automated linting and deployment of Kubernetes manifests.
* **Monitoring Stack:** Deploying Prometheus and Grafana for long-term historical data visualization and alerting.
