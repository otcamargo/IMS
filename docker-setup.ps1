Clear-Host

Write-Host "[1] start prometheus, grafana and cadvisor"

$Input = Read-Host 

if ($input -eq 1) {
  Write-Host "----------------- Starting prometheus -----------------"
  docker run --network="location-service_default" -d --name prometheus -p 9090:9090 -v D:\Otavi\Workspace\repos-that-need-fixing\prometheus\IMS\prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus --config.file=/etc/prometheus/prometheus.yml
  Write-Host "----------------- Starting grafana -----------------"
  docker run --network="location-service_default" -d --name grafana -p 3000:3000 grafana/grafana
  Write-Host "----------------- Starting cadvisor -----------------"
  docker run --network="location-service_default" --volume /:/rootfs:ro --volume /var/run:/var/run:rw --volume /sys:/sys:ro --volume /var/lib/docker/:/var/lib/docker:ro -d --name cadvisor -p 8080:8080 google/cadvisor
  docker container ls
}
else {
  Write-Host "Invalid"
}
