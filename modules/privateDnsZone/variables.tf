# ================
#  AKS Private DNS Zone
# ================

variable "aks_private_dns_zone_name" {
  type = string
  description = "The name of the private DNS zone"
}

variable "aks_private_dns_zone_location" {
    type = string
    description = "The Azure location to deploy to"
    default = "West Europe"
}