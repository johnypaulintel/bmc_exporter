#!/bin/bash

URL="http://localhost:5000/metrics"

# Try to fetch metrics with connect and read timeouts
response=$(curl -s --connect-timeout 5 --max-time 10 "$URL")

if [[ $? -ne 0 || -z "$response" ]]; then
    echo "❌ Exporter is not responding at $URL or returned no data."
    exit 1
fi

# Check for BMC state value
if echo "$response" | grep -q 'habana_bmc_state{[^}]*} 1'; then
    echo "✅ BMC exporter is running and BMC is reachable."
elif echo "$response" | grep -q 'habana_bmc_state{[^}]*} [^1]'; then
    echo "⚠️  BMC exporter is running, but BMC may be unreachable (state != 1)."
else
    echo "❓ Exporter is running but no BMC state metric found."
    echo "

