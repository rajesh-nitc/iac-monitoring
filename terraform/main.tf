provider "aws" {
  version = "~> 2.0"
  region  = "ap-south-1"
}

locals {
  ports = {
    Prometheus   = "9090"
    Grafana = "3000"
    Node_Exporter = "9100"
    Ssh = "22"
  }

  tags = {
    Name   = "monitoring"
    Env = "dev"
  }

}

resource "aws_instance" "monitoring_instance" {
  ami           = "ami-0447a12f28fddb066"
  instance_type = "t2.micro"
  key_name = "monitoring"
  monitoring = true 
  vpc_security_group_ids = [
      aws_security_group.monitoring.id,
  ]

  user_data = templatefile("${path.module}/templates/monitoring-instance.tmpl", {
    sample_instance_1 = aws_instance.sample_instance[0].private_ip,
    sample_instance_2 = aws_instance.sample_instance[1].private_ip,
  })

  tags = local.tags
}

resource "aws_instance" "sample_instance" {
  count = 2
  ami           = "ami-0447a12f28fddb066"
  instance_type = "t2.micro"
  key_name = "monitoring"
  monitoring = true 
  vpc_security_group_ids = [
      aws_security_group.monitoring.id,
  ]

  user_data = templatefile("${path.module}/templates/sample-instance.tmpl", {})

  tags = {
    Name   = "sample_instance_${count.index + 1}"
  }
}

resource "aws_security_group" "monitoring" {
  name   = "allow_all"

  dynamic "ingress" {
    for_each = local.ports
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}