# AWS Two-Tier Employee Portal using Terraform

## Architecture

- Custom VPC
- Public Subnet
- Private Subnet
- Internet Gateway
- NAT Gateway
- Public Route Table
- Private Route Table
- Security Groups
- Public EC2 (Web Server / Bastion Host)
- Private EC2 (MariaDB Server)

## Technologies

- Terraform
- AWS EC2
- VPC
- MariaDB
- Flask
- Python

## Deployment

```bash
terraform init
terraform validate
terraform plan
terraform apply
```
