# # Use the official Terraform image from HashiCorp
# FROM hashicorp/terraform:latest

# # Set the working directory inside the container
# WORKDIR /workspace

# # Copy your project files to the Docker image
# COPY . /workspace

# # Run the init command (optional)
# RUN terraform init

# # This will execute Terraform apply when the container runs
# CMD ["terraform", "apply", "-auto-approve"]
FROM hashicorp/terraform:latest

WORKDIR /terraform

# Copy Terraform configuration files
COPY *.tf .


# Initialize Terraform (optional, you can also do this at runtime)
RUN terraform init

# Default command
CMD ["terraform"]