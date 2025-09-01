# Steps

0. Use branch `smc`
1. Configure BMC IP, username, and password in [bmc_exporter/config.json](bmc_exporter/config.json)
2. Start bmc-exporter container
   ```sh
   ./bmcexporter_container.sh
   ```
3. Followed by Prometheus container
   ```sh
   ./prometheus_container.sh
   ```
4. Confirm that everything is running by `docker ps`
5. Check logs from bmc-exporter container, make sure there're no errors: `docker logs bmc-exporter`
6. Check output of bmc-exporter by `curl localhost:5000/metrics`
7. Check the output of Prometheus:
   ```sh
   curl http://localhost:9090/-/healthy
   curl http://localhost:9090/targets
   ```
