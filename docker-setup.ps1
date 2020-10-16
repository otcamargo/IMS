Clear-Host

Write-Host "[1] start prometheus and grafana"

$Input = Read-Host 

if ($input -eq 1) {
  Write-Host "----------------- Starting prometheus -----------------"
  docker run --network="data-gather-service_default" -d --name prometheus -p 9090:9090 -v D:\Otavi\Workspace\repos-that-need-fixing\prometheus\IMS\prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus --config.file=/etc/prometheus/prometheus.yml
  Write-Host "----------------- Starting grafana -----------------"
  docker run --network="data-gather-service_default" -d --name grafana -p 3000:3000 grafana/grafana
  docker container ls
}
else {
  Write-Host "Invalid"
}
