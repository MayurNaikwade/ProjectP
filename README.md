# ProjectP – Production-Grade ECS Fargate Deployment

This repository demonstrates a production-grade DevOps workflow for deploying a simple API service on AWS.  

---

## Objective

The objective of this project is to demonstrate the ability to:
- Containerize and deploy a service on AWS
- Automate CI/CD pipelines using GitHub Actions
- Implement monitoring and alerting
- Apply IAM least-privilege and HTTPS enforcement
- Document a clear, reproducible cloud architecture

---

## Application Overview

The service is a simple **FastAPI** application exposing two endpoints:

| Endpoint        | Description                       |
|-----------------|-----------------------------------|
| `GET /health`   | Health check endpoint             |
| `GET /predict`  | Returns a static prediction score |

Example response:
```json
{ "score": 0.85 }

---

## Architecture

### Components

- **Route53** – DNS for `api.mayurnaikwade.com`
- **Application Load Balancer (ALB)** – TLS termination and traffic routing
- **AWS Certificate Manager (ACM)** – HTTPS certificates
- **ECS Fargate** – Serverless container orchestration
- **Amazon ECR** – Container image registry
- **CloudWatch** – Logs, metrics, dashboards, and alarms
- **Terraform** – Infrastructure as Code
- **GitHub Actions** – CI/CD automation

---

### Traffic Flow

1. Client sends an HTTPS request to `https://api.mayurnaikwade.com`
2. Route53 resolves the domain to the Application Load Balancer
3. ALB enforces HTTPS and forwards traffic to the ECS target group
4. ECS Fargate tasks run the containerized API in private subnets
5. Logs and metrics are emitted to CloudWatch
6. Alarms monitor service health and resource usage

---

### Architecture Diagram

```mermaid
flowchart LR
  U[User] -->|HTTPS| R53[Route53 api.mayurnaikwade.com]
  R53 --> ALB[ALB :443 TLS]
  ALB --> TG[Target Group /health]
  TG --> ECS[ECS Fargate Service]
  ECS --> CWL[CloudWatch Logs]
  ECS --> CWM[CloudWatch Metrics]
  CWM --> AL[CloudWatch Alarms]
