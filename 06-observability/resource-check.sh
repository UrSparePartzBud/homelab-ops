#!/bin/bash
DATE=$(date +"%Y-%m-%d_%H-%M")
FILE="utilization_$DATE.txt"

echo "--- CLUSTER RESOURCE REPORT ($DATE) ---" | tee -a $FILE
echo "NODE UTILIZATION:" | tee -a $FILE
kubectl top nodes | tee -a $FILE
echo "" | tee -a $FILE
echo "TOP 5 HEAVIEST PODS:" | tee -a $FILE
kubectl top pods -A --sort-by=cpu | head -n 6 | tee -a $FILE
