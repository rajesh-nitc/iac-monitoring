# Iac
Monitor instances with Prometheus and Grafana
## Getting Started

### Deploy
Deploy monitoring instance with Prometheus & Grafana and two sample instances with Node Exporter

```
cd terraform
terraform init
terraform validate
terraform plan
terraform apply --auto-approve
```

### Datasource
Manually add Prometheus datasource in Grafana and test the connection

### Query
Monitor instance metrics

### Alerts