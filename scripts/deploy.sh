#!/usr/bin/env bash

# Exit immediately if a command fails
set -e

echo "============================================="
echo " Starting DevOps Deployment Pipeline"
echo " Triggered by: ${TRIGGERED_USER:-local-user}"
echo " Commit SHA:   ${COMMIT_HASH:-local-commit}"
echo "============================================="

# 1. Validation Step: Ensure index.html exists
echo "[Step 1/3] Checking if index.html exists..."
if [ -f "index.html" ]; then
    echo "✔ index.html found successfully!"
else
    echo "✖ Error: index.html is missing!"
    exit 1
fi

# 2. Basic Content Check
echo "[Step 2/3] Validating HTML content..."
if grep -q "Hello from GitHub Actions" index.html; then
    echo "✔ Verification passed: HTML title keyword found."
else
    echo "✖ Verification failed: Required content missing from index.html"
    exit 1
fi

# 3. Simulated Deployment Step
echo "[Step 3/3] Deploying files to server / cloud storage..."
# (In real life, this is where you'd run: aws s3 sync . s3://bucket or scp to your server)
sleep 2

echo "✔ Deployment finished successfully!"
echo "============================================="