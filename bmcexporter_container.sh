docker rm -f bmc-exporter
docker run --name bmc-exporter -d --network host -p 5000:5000 -v $PWD/bmc_exporter/config.json:/app/config.json -v $PWD/bmc_exporter/smcredfish.yaml:/etc/g3redfish.yaml vault.habana.ai/habana-bmc-exporter/bmc-exporter:1.21.2-76 -config /app/config.json -exporter='g3-red-fish' -daemon-set=false
