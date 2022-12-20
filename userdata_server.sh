#!/bin/bash
apt update
apt install prometheus -y
apt install -y apt-transport-https
apt install -y software-properties-common wget
wget -q -O /usr/share/keyrings/grafana.key https://apt.grafana.com/gpg.key
echo "deb [signed-by=/usr/share/keyrings/grafana.key] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
apt update
apt install grafana -y
systemctl daemon-reload
systemctl start grafana-server
systemctl enable grafana-server
wget https://dellops-stack-monitoramento.s3.amazonaws.com/prometheus.yml
mv prometheus.yml /etc/prometheus/
chown -R prometheus:prometheus /etc/prometheus/
systemctl restart prometheus