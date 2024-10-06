# Project Steps

1. **Install Azure CLI and kubectl**  
   First, you need to install the Azure CLI and kubectl in order to interact with Azure and your Kubernetes cluster.

2. **Use Terraform Docker Image to Run Terraform Commands**  
   We use a Terraform Docker image to run Terraform commands. This allows us to manage infrastructure as code within a containerized environment.

3. **Service Principal for Terraform**  
   Terraform requires a Service Principal to deploy resources on Azure. We use this Service Principal to authenticate and authorize Terraform actions.

4. **Generate a Service Principal**  
   To create the Service Principal, log in to the Azure CLI and run the following command:

   ```bash
   az ad sp create-for-rbac --name terraformSP --role contributor --scopes /subscriptions/<subscription_id>

5. **Deploy an Auto-Scaling Kubernetes Cluster Using Terraform**  
   We use Terraform to deploy a Kubernetes cluster on Azure that is configured to autoscale based on resource demand.
   notes: 
    * use this command : sed -i 's/\r$//' run-terraform.sh to removes the carriage return characters from the script, fixing the ^M issue


6. **Create an Ansible Docker Image with kubernetes.core**  
   An Ansible Docker image is built with the `kubernetes.core` collection. This image will be used to manage Kubernetes resources through Ansible playbooks.

7. **Create a GitHub PAT for Argo CD Access**  
   A Personal Access Token (PAT) is created in GitHub and stored in Kubernetes secrets. This allows Argo CD to authenticate and access the GitHub repository using the username and PAT.

8. **Ansible Playbooks**  
   We use two Ansible playbooks in this project:
   
   - The **first playbook** installs the Splunk Operator and Argo CD on the Kubernetes cluster.
   - The **second playbook** configures Argo CD to track files in the GitHub repository and apply any changes to the cluster. These changes 
   involve managing Splunk standalone instances.

   Note : 
   * if get a problem like : unable to connect to the server: dial tcp: lookup dns-rare-tiger-hlq5coj8.hcp.francecentral.azmk8s.io on 8.8.8.8:53: no such host
   run these commands to set kubeconfig env variable: ls /mnt/c/Users/Imane\ Houbbane/.kube/config
   export KUBECONFIG=/mnt/c/Users/Imane\ Houbbane/.kube/config



First, let's forward the port using the following command:  
```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
```
   
Now, we can see in Argo CD that we have one standalone replica by visiting [http://localhost:8080]:


Let's change the number of replicas for our standalone instance by modifying the configuration in our GitHub repository, which is tracked by Argo CD.

In the `splunk/standalone.yaml` file, update the number of replicas.

Now let's check the changes in Argo CD to see if the new configuration has been applied.









