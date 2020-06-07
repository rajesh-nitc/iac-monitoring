# Iac
Monitor instances with Prometheus and Grafana
## Getting Started

### Deploy
```
cd terraform
terraform init
terraform validate
terraform plan
terraform apply --auto-approve
```
This will deploy a monitoring instance with Prometheus and Grafana and two sample instances with Node Exporter