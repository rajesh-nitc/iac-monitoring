# Iac
Monitor on-premise and cloud instances
## Getting Started
We will deploy a monitoring instance and 2 sample instances. Monitoring instance will host Prometheus and Grafana. Sample instances will host Node Exporter. In our example, to keep things simple, sample instances are acting as both on-premise instances (with Node Exporter installed) and cloud instances (with ```monitoring = true```).
1. Monitor on-premise instances with Prometheus (Node Exporter) and Grafana
2. Monitor cloud instances with CloudWatch and Grafana
### Deploy

```
cd terraform
terraform init
terraform validate
terraform plan
terraform apply --auto-approve
```
### Post Deploy
For on-premise, add Prometheus datasource and for cloud instances, add CloudWatch datasource. Build dashboard, configure alerts and notification channels for each datasource