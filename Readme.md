# Infrastructure Repository for Next.js Portfolio Tenants

This repository contains the infrastructure setup for deploying and managing tenants of a **Next.js Portfolio Application**. It leverages Kubernetes for deployment and includes configuration files for managing multiple tenants with Docker images hosted on Docker Hub.

## Use Case
This repository is designed to handle the deployment of tenant-specific Next.js portfolio applications in a scalable and isolated manner. Each tenant can run on a unique port, allowing for custom configurations and independent service management.

The codebase for the Next.js Portfolio Application can be found [here](https://github.com/SouravBandyopadhyay/nextjs-developer-portfolio.git).

## Repository Structure
```
.
├── tenant1
│   ├── deployment.yaml    # Kubernetes Deployment for Tenant 1
│   ├── service.yaml       # Kubernetes Service for Tenant 1
├── tenant2
│   ├── deployment.yaml    # Kubernetes Deployment for Tenant 2
│   ├── service.yaml       # Kubernetes Service for Tenant 2
├── README.md              # Documentation (this file)
```

## Prerequisites
- Kubernetes cluster (local or cloud-based)
- Docker installed and configured
- Kubectl CLI installed and configured to interact with your cluster

## How to Use

### 1. Build and Push Docker Images
Ensure the tenant-specific Docker images are built and pushed to Docker Hub:
```bash
# Build Docker image for tenant1
docker buildx build -t sourav2805/nextjs-portfolio:tenant1 .
# Push the image to Docker Hub
docker push sourav2805/nextjs-portfolio:tenant1

# Build Docker image for tenant2
docker buildx build -t sourav2805/nextjs-portfolio:tenant2 .
# Push the image to Docker Hub
docker push sourav2805/nextjs-portfolio:tenant2
```

### 2. Apply Kubernetes Configurations
Deploy the tenants to your Kubernetes cluster by applying the configuration files:
```bash
# Deploy Tenant 1
kubectl apply -f tenant1/deployment.yaml
kubectl apply -f tenant1/service.yaml

# Deploy Tenant 2
kubectl apply -f tenant2/deployment.yaml
kubectl apply -f tenant2/service.yaml
```

### 3. Verify Deployments
Check the status of the pods and services:
```bash
# List pods
kubectl get pods

# List services
kubectl get services
```
Ensure that the pods for each tenant are running and the services are accessible.

### 4. Access the Applications
- Use the **NodePort** or **LoadBalancer** (depending on your service type) to access the tenant applications.
- Example:
  - Tenant 1: `http://<Node IP>:<NodePort>`
  - Tenant 2: `http://<Node IP>:<NodePort>`

### 5. Modify Configuration (if needed)
Update `deployment.yaml` or `service.yaml` files to change resources, ports, or other configurations as required.

## Key Features
- **Tenant Isolation**: Each tenant runs independently with its own deployment and service.
- **Scalability**: Kubernetes allows horizontal scaling for tenant applications.
- **Custom Port Configuration**: Each tenant can be configured to run on a specific port.

## Future Enhancements
- Add monitoring and logging setup for each tenant (e.g., Prometheus, Grafana).
- Automate Docker image builds and pushes using a CI/CD pipeline.
- Use Helm charts for easier configuration management.

## Support
If you encounter any issues or have questions, please feel free to open an issue in this repository or contact the repository owner.