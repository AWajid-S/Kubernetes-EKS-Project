# AWS EKS GitOps Project

A hands-on Kubernetes project where I provisioned an Amazon EKS cluster with Terraform and deployed an application using Argo CD.

The project also included automated DNS, HTTPS certificates and Ingress routing.

## What I Built

- Custom AWS VPC with public and private subnets
- Amazon EKS cluster with managed worker nodes
- Terraform remote state stored in S3
- IAM Roles for Service Accounts
- NGINX Ingress Controller
- cert-manager with Let's Encrypt
- ExternalDNS with Route 53
- Argo CD GitOps deployment
- Kubernetes Deployment, Service and Ingress

## Architecture

```text
GitHub
   ↓
Argo CD
   ↓
Amazon EKS
   ↓
NGINX Ingress
   ↓
Kubernetes Service
   ↓
Application Pod

cert-manager → HTTPS certificates
ExternalDNS  → Route 53 records
```

## Tools Used

- AWS
- Terraform
- Kubernetes
- Helm
- Argo CD
- NGINX Ingress
- cert-manager
- ExternalDNS
- Route 53
- GitHub

## Repository Structure

```text
K8s Project/
├── apps/
├── argo-cd/
├── cert-man/
├── helm-values/
├── eks.tf
├── helm.tf
├── irsa.tf
├── locals.tf
├── providers.tf
└── vpc.tf
```

## Key Challenges Solved

- Fixed an S3 backend region error
- Updated an unsupported EKS version
- Resolved Terraform provider compatibility issues
- Updated outdated cert-manager configuration
- Fixed an ExternalDNS Helm chart mismatch
- Replaced a failing NGINX chart
- Corrected the Argo CD repository path
- Diagnosed DNS propagation and NXDOMAIN caching
- Removed versioned S3 state objects during cleanup

## What I Learnt

- Provisioning EKS infrastructure with Terraform
- Kubernetes networking and Ingress
- GitOps deployment with Argo CD
- DNS automation with ExternalDNS
- TLS automation with cert-manager
- Using IRSA instead of static AWS credentials
- Troubleshooting AWS and Kubernetes deployments
- Safely destroying cloud infrastructure

## Project Evidence

The screenshots below show the project progressing from infrastructure provisioning through to a working GitOps deployment.

### Terraform Infrastructure Provisioning

Terraform successfully created the AWS infrastructure, including the EKS cluster, networking and supporting resources.

![Terraform apply complete](Screenshot%20for%20K8s/02-terraform-apply-complete.png)

### Amazon EKS Cluster

The EKS cluster was created successfully and became active in the `eu-west-2` region.

![EKS cluster overview](Screenshot%20for%20K8s/05-eks-cluster-overview.png)

### Argo CD GitOps Deployment

Argo CD synchronised the Kubernetes manifests from GitHub and deployed the application resources into the cluster.

![Argo CD synced and healthy](Screenshot%20for%20K8s/18-argocd-app-synced-healthy.png)

### Application Running

The AppHub application was exposed through NGINX Ingress and made publicly accessible through the configured domain.

![AppHub application](Screenshot%20for%20K8s/17-apphub-application-live.png)

### Automated DNS Records

ExternalDNS created the required Route 53 records for both Argo CD and the application.

![Route 53 DNS records](Screenshot%20for%20K8s/19-route53-dns-records.png)
## Project Outcome

The project was successfully provisioned, deployed and tested.

The final solution included:

- Infrastructure managed with Terraform
- Kubernetes workloads running on Amazon EKS
- GitOps deployment through Argo CD
- Public routing through NGINX Ingress
- Automated DNS with ExternalDNS
- HTTPS certificates managed by cert-manager

After testing, I removed the EKS cluster, load balancer, NAT gateway, Route 53 hosted zone and Terraform state bucket to prevent ongoing AWS charges.
