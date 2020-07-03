# Iac
Monitor instances
## Getting Started
We will deploy a monitoring instance and 2 sample instances. Monitoring instance will host Prometheus and Grafana and send its metrics to CloudWatch (with ```monitoring = true```). Sample instances will host Node Exporter and they will send their metrics to Prometheus.

### Deploy

```
cd terraform
terraform init
terraform validate
terraform plan
terraform apply --auto-approve
```
### Post Deploy
add CloudWatch datasource and add Prometheus datasource
