variable "resource_group_location" {
  type        = string
  default     = "francecentral"
  description = "Location of the resource group."
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

# variable "node_count" {
#   type        = number
#   description = "The initial quantity of nodes for the node pool."
#   default     = 1
# }

variable "msi_id" {
  type        = string
  description = "The Managed Service Identity ID. Set this value if you're running this example using Managed Identity as the authentication method."
  default     = null
}

variable "username" {
  type        = string
  description = "The admin username for the new cluster."
  default     = "azureadmin"
}

variable "name_cluster" {
  type        = string
  description = "The name of the cluster."
  default     = "splunk-cluster"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
  default     = "splunk-rg"
}

variable "location" {
  type        = string
  description = "The location of the resource group."
  default     = "francecentral"
}


# variable "subscription_id" {
#   type        = string
#   description = "Azure Subscription ID"
# }

# variable "client_id" {
#   type        = string
#   description = "Azure Client ID"
# }

# variable "client_secret" {
#   type        = string
#   description = "Azure Client Secret"
#   sensitive   = true
# }

# variable "tenant_id" {
#   type        = string
#   description = "Azure Tenant ID"
# }
