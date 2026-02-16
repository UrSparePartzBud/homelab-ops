# Module 5: Persistent Storage with Longhorn

## Current Configuration
* **Status:** Operational
* **Namespace:** `longhorn-system`
* **Deployment Scale:** 27 pods managing distributed block storage
* **Hardware Integration:** Utilizing local storage across `k3s-node-01`, `02`, and `03`

## Capabilities
* **Replication:** Configured for high availability; data is replicated across nodes to prevent loss during hardware failure.
* **Management:** Accessible via the Longhorn UI (integrated with the existing Portainer/Dashboard setup).
