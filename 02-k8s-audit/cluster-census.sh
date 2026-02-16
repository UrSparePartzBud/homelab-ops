#!/bin/bash

# Get current date
DATE=$(date +"%Y-%m-%d_%H-%M")
REPORT_FILE="cluster_report_$DATE.txt"

echo "===========================================" | tee -a $REPORT_FILE
echo "   K3S CLUSTER CENSUS REPORT - $DATE"       | tee -a $REPORT_FILE
echo "===========================================" | tee -a $REPORT_FILE
echo "" | tee -a $REPORT_FILE

echo "[1] CLUSTER IDENTITY" | tee -a $REPORT_FILE
kubectl cluster-info | head -n 2 | tee -a $REPORT_FILE
echo "" | tee -a $REPORT_FILE

echo "[2] NODE HEALTH" | tee -a $REPORT_FILE
# Shows OS, Kernel, and Container Runtime (Containerd)
kubectl get nodes -o wide | tee -a $REPORT_FILE
echo "" | tee -a $REPORT_FILE

echo "[3] WORKLOAD CENSUS (Pods per Namespace)" | tee -a $REPORT_FILE
kubectl get pods -A --no-headers | awk '{print $1}' | sort | uniq -c | sort -nr | tee -a $REPORT_FILE
echo "" | tee -a $REPORT_FILE

echo "[4] CRITICAL ADD-ONS" | tee -a $REPORT_FILE
# Checks specifically for K3s defaults and your add-ons
COMPONENTS=("traefik" "coredns" "metrics-server" "longhorn-manager" "portainer")

for app in "${COMPONENTS[@]}"; do
  # check if any pod contains the app name
  if kubectl get pods -A | grep -q "$app"; then
    echo "✅ $app is ACTIVE" | tee -a $REPORT_FILE
  else
    echo "⚠️ $app NOT found" | tee -a $REPORT_FILE
  fi
done

echo "" | tee -a $REPORT_FILE
echo "Report generated: $REPORT_FILE"
