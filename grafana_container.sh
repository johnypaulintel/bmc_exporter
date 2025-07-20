mkdir -p grafana

docker rm -f grafana

mkdir grafana
docker run -d --name=grafana \
    --user root \
    --network=host -e http_proxy=$http_proxy -e https_proxy=$https_proxy \
    -e GF_SECURITY_ADMIN_USER=admin -e GF_SECURITY_ADMIN_PASSWORD=admin \
    -v $PWD/grafana:/var/lib/grafana \
    grafana/grafana-oss

