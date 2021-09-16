# ================
#  Resource Group
# ================

variable "resource_group_name" {
  type        = string
  description = "Location used for all resources in this project. Defaults to 'West Europe'"
  default     = "rg-aksdojo-lab1"
}

variable "location" {
  type        = string
  description = "Location used for all resources in this project. Defaults to 'West Europe'"
  default     = "West Europe"
}

# ================
#  AKS Cluster
# ================

variable "aks_cluster_name" {
  type        = string
  description = "Name of the AKS cluster"
  default = "aksdojolab1"
}

variable "aks_cluster_kubernetes_version" {
  type       = string
  description = "Version of Kubernetes to use for the cluster"
  default    = "1.21.2"
}

variable "aks_cluster_dns_prefix" {
  type = string
  description = "The DNS prefix to use for the cluster."
  default = "aksdojolab1"
}

variable "aks_systempool_vm_size" {
  type = string
  description = "The VM size to use for the for the system pool."
  default = "Standard_DS3_V2"
}

variable "aks_systempool_node_count" {
  type = number
  description = "The number of nodes to use for the system pool."
  default = 1
}

# ================
#  Private DNS Zone
# ================

variable "aks_private_dns_zone_name" {
  type = string
  description = "The name of the private DNS zone"
  default = "privatelink.westeurope.azmk8s.io"
}