
# Azure Kubernetes Cluster Setup with GitOps Workflow

## Overview
This guide outlines the steps to set up an Azure Kubernetes Service (AKS) cluster using Terraform, implement GitOps practices with ArgoCD, and deploy Splunk instances. The process involves using various tools and technologies to create a robust, scalable, and manageable Kubernetes environment.

## Architecture

![gitops_architecture](https://github.com/user-attachments/assets/32acfde7-7a68-491d-99a5-37a4c63a79ac)


## Prerequisites
- Azure subscription
- GitHub account
- Basic knowledge of Kubernetes, Terraform, and Ansible

## Steps

### 1. Install Required Tools
Install the following tools on your local machine:
- Azure CLI
- kubectl
- Docker Engine

These tools are essential for interacting with Azure, managing your Kubernetes cluster, and creating images for Ansible and Terraform.

### 2. Create AKS Cluster using Terraform
Terraform requires a Service Principal to deploy resources on Azure. Follow these steps:
- **a. Create a Service Principal:**
  ```bash
  az ad sp create-for-rbac --name terraformSP --role contributor --scopes /subscriptions/<subscription_id>
  ```
- **b. Use Terraform to create an AKS cluster with autoscaling capabilities.**
- **c. Configuration:**
  - Modify the content in `.env.example` with your information.
  - Rename the file to `.env`.

### 3. Connect to the AKS Cluster
Execute the following commands to connect to your newly created cluster:
- **a. Connect to Azure account:**
  ```bash
  az login --use-device-code
  ```
- **b. Set the cluster subscription:**
  ```bash
  az account set --subscription <your_subscription_id>
  ```
- **c. Download cluster credentials:**
  ```bash
  az aks get-credentials --resource-group <resource_group_name> --name <cluster_name> --overwrite-existing

### 4. Install and Configure Splunk Operator and ArgoCD
Use Ansible to install and configure the necessary components:
- **a. First Ansible playbook:**
  - Installs Splunk Operator
  - Installs ArgoCD on the Kubernetes cluster
- **b. Second Ansible playbook:**
  - Configures ArgoCD to track files in the GitHub repository.
  - Applies changes to manage Splunk standalone instances.
  **Note:** Modify the content in `.env.example` with your information and rename it to `.env`.

### 5. Implement GitOps Workflow
Follow these steps to implement and test the GitOps workflow:
- **a. Forward the ArgoCD server port:**
  ```bash
  kubectl port-forward svc/argocd-server -n argocd 8080:443
  ```
- **b. Retrieve the ArgoCD admin password:**
  ```bash
  kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 --decode
  ```
- **c. Access the ArgoCD UI:**
  - Open a web browser and go to [http://localhost:8080].
  - Log in using the admin password obtained in the previous step.
- **d. Verify initial setup:**
  - Check that you have one standalone Splunk replica.

  ![before_modification](https://github.com/user-attachments/assets/89f46652-8d3e-44cb-9822-fcc5f4aac433)

- **e. Modify the configuration:**
  - In your GitHub repository, locate the `splunk/standalone.yaml` file.
  - Update the number of replicas.
    
![modif_reeplicas](https://github.com/user-attachments/assets/68b46c4c-60a4-42b0-a421-d1c66cf49c5b)

- **f. Verify changes:**
  - Check the ArgoCD UI to confirm that the new configuration has been applied.
    
 ![after_modif](https://github.com/user-attachments/assets/8ac47d4a-093c-4ccb-8604-8ad48c62f60e)


## Conclusion
You have successfully set up an Azure Kubernetes Service cluster using Terraform, implemented a GitOps workflow with ArgoCD, and deployed Splunk instances. This setup allows for easy management and scaling of your Kubernetes environment. You can now modify any parameter in your GitHub repository, and ArgoCD will automatically apply these changes to your cluster.
