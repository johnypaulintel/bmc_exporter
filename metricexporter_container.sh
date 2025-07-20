docker rm -f metric_exporter

docker run -d --privileged --network=host \
    -e http_proxy=$http_proxy -e https_proxy=$https_proxy \
    -v /dev:/dev --name metric_exporter \
    vault.habana.ai/gaudi-metric-exporter/metric-exporter:1.20.0-543 --port 41611
