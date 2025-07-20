docker rm -f bmc-exporter
docker run --name bmc-exporter -d --network host -p 5000:5000 -v $PWD/bmc_exporter:/tmp vault.habana.ai/habana-bmc-exporter/bmc-exporter:1.21.2-76 -config /tmp/bmc_exp_config.json -daemon-set false --exporter='g3-red-fish'
