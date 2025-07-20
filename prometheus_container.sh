docker rm -f prometheus

docker run -d --privileged --network=host -p 9090:9090 \
    -e http_proxy=$http_proxy -e https_proxy=$https_proxy \
    --name prometheus -v $PWD/prometheus:/etc/prometheus \
    prom/prometheus --config.file=/etc/prometheus/prometheus.yml
