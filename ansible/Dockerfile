# Use an official Python runtime as a base image
FROM python:latest

# Set the working directory in the container
WORKDIR /usr/src/app

# Install Ansible, Ansible Kubernetes collections, and necessary Python libraries
RUN pip install --no-cache-dir ansible openshift && \
    ansible-galaxy collection install kubernetes.core

# Copy the Ansible playbook into the container
COPY argocd_gitops_setup.yml ./
COPY install_argocd_splunk_operator.yml ./

# Command to execute the playbook
CMD ["ansible-playbook"]

